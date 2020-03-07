class Dog < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :father, class_name: 'Dog', optional: true
  belongs_to :mother, class_name: 'Dog', optional: true
  has_many :children_of_father, class_name: 'Dog', foreign_key: 'father_id'
  has_many :children_of_mother, class_name: 'Dog', foreign_key: 'mother_id'
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 355 }

  enum sex: %i[male female]
  enum color_type: %i[monochrome bicolor tricolor]

  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes[:image].blank? },
    allow_destroy: true

  attr_accessor :depth

  def genealogy(depth = 3)
    result = []
    init_father = self.father.presence || Dog.new(name: 'None')
    init_mother = self.mother.presence || Dog.new(name: 'None')
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
        father = stack_element.father.presence || Dog.new(name: 'None')
        mother = stack_element.mother.presence || Dog.new(name: 'None')
        father.depth, mother.depth = [depth_counter + 1, depth_counter + 1]
        stack.unshift(*[father, mother])
      end
    end
    result
  end

  def rowspan(tree_depth = 3, self_depth)
    2**(tree_depth - self_depth)
  end

  def descendant_count(sex = :male)
    return Dog.where(father: self, sex: sex).count if male?
    Dog.where(mother: self, sex: sex).count
  end
end
