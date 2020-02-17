class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum status: %i[draft published inactive]

  belongs_to :category

  validates :title, length: { maximum: 355 }, presence: true
end
