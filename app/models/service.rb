class Service < ApplicationRecord
  belongs_to :site_setting, -> { service }

  validates :title, presence: true

  enum status: %i[disabled active]
end
