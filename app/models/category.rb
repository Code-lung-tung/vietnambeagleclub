class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum status: %i[disabled active]

  has_many :articles

  validates :name, length: { maximum: 355 }, presence: true
end
