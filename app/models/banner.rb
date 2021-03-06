class Banner < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :site_setting, -> { banner }

  validates :image, presence: true

  enum status: %i[disabled active]
end
