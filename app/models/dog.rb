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

  scope :by_male, ->{ where(sex: 'male').order(created_at: :desc) }
  scope :by_id, ->(id){ where(id: id) if id.present? }
  scope :by_name, ->(name){ where("name like '% ? %'", name) if name.present? }
  scope :by_sex, ->(sex){ where(sex: sex) if sex.present? }
  scope :by_color, ->(color){ where(color_type: color) if color.present? }
  scope :by_date, ->(from, to){ where('date_of_birth BETWEEN ? AND ?', from, to) if from.present? && to.present? }
  scope :order_by_field, ->(field){ order('? asc', field) if field.present? }
end
