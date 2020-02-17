class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum status: %i[disabled active]

  validates :name, length: { maximum: 355 }, presence: true
end
