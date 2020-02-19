class Dog < ApplicationRecord
  belongs_to :father, class_name: 'Dog', optional: true
  belongs_to :mother, class_name: 'Dog', optional: true
  has_many :children_of_father, class_name: 'Dog', foreign_key: 'father_id'
  has_many :children_of_mother, class_name: 'Dog', foreign_key: 'mother_id'

  enum sex: %i[male female]
  enum color_type: %i[monochrome bicolor tricolor]
end
