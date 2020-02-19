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
end
