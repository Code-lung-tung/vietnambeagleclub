class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :dog

  validates :image, presence: true
end
