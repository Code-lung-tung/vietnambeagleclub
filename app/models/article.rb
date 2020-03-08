class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :photo, PhotoUploader

  enum status: %i[draft published inactive]
  enum type_of: %i[write share]

  belongs_to :category

  validates :title, length: { maximum: 355 }, presence: true
  validates :photo, :category_id, presence: true
end
