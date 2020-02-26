class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :photo, PhotoUploader

  enum status: %i[draft published inactive]

  belongs_to :category

  validates :title, length: { maximum: 355 }, presence: true
  validates :photo, :category_id, presence: true
  	
  scope :active, ->{ where(status: statuses[:published]) }
end
