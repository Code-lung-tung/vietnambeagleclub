class Service < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :site_setting, -> { service }

  validates :title, :image, presence: true

  enum status: %i[disabled active]
end
