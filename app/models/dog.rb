class Dog < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :father, class_name: 'Dog', optional: true
  belongs_to :mother, class_name: 'Dog', optional: true
  has_many :children_of_father, class_name: 'Dog', foreign_key: 'father_id'
  has_many :children_of_mother, class_name: 'Dog', foreign_key: 'mother_id'
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 355 }
  validates :price, presence: true
  validates :title, presence: true

  enum sex: %i[male female]
  enum color_type: %i[monochrome bicolor tricolor]

  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes[:image].blank? },
    allow_destroy: true

  scope :not_this_one, ->(dog) { where.not(id: dog.id) }
  scope :siblings, ->(dog) { not_this_one(dog).where(mother: dog.mother, father: dog.father) }
  scope :half_brother, ->(dog, common_parent) do
    diff_parent = common_parent == :father ? :mother : :father
    where(common_parent => dog.send(common_parent)).where.not(diff_parent => dog.send(diff_parent))
  end
  scope :offspring, ->(dog) { where(mother: dog).or(where(father: dog)) }

  attr_accessor :depth

  def genealogy(depth = 3)
    result = []
    init_father, init_mother = parents(self)
    self.depth, init_father.depth, init_mother.depth = [0, 1, 1]
    stack = [init_father, init_mother]
    depth_counter = 0
    result_item = [self]
    while stack.any?
      stack_element = stack.shift
      result_item.push(stack_element)
      if stack_element.depth >= depth
        result.push(result_item)
        result_item = []
        depth_counter = stack.first.depth - 1 if stack.any?
      else
        depth_counter += 1
        father, mother = parents(stack_element)
        father.depth, mother.depth = [depth_counter + 1, depth_counter + 1]
        stack.unshift(*[father, mother])
      end
    end
    result
  end

  def rowspan(tree_depth: 3, self_depth:)
    2**(tree_depth - self_depth)
  end

  def descendant_count(sex = :male)
    return Dog.where(father: self, sex: sex).count if male?
    Dog.where(mother: self, sex: sex).count
  end

  def details_info
    [
      [father&.name.presence || 'None', mother&.name || 'None'].compact.join(' x '),
      sex? ? I18n.t("activerecord.attributes.dog.sexes.#{sex}") : nil,
      color_type? ? I18n.t("activerecord.attributes.dog.color_types.#{color_type}") : nil,
      owner,
      living_address? ? living_address : nil
    ].compact.join(', ')
  end

  class << self
    def ordered_column_names
      %i[name sex color_type microchip_number owner living_address description date_of_birth date_of_death]
    end
  end

  private

  def parents(dog)
    [dog.father.presence || Dog.new(name: 'None'), dog.mother.presence || Dog.new(name: 'None')]
  end
end
