class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :dog, optional: true
  belongs_to :sale, optional: true

  validates :image, presence: true
end
