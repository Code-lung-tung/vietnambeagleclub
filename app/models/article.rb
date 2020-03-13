class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :photo, PhotoUploader

  enum status: %i[draft published]
  enum category: %i[normal experience]

  validates :title, length: { maximum: 355 }, presence: true
  validates :photo, presence: true

  def display_date
    date = published_date || created_at
    date.strftime('%B %d, %Y')
  end
end
