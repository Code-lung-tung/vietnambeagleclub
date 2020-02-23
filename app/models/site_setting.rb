class SiteSetting < ApplicationRecord
  has_many :banners, dependent: :destroy
  has_many :services, dependent: :destroy

  enum setting_type: %i[
                         site_title site_logo google_map about_me policy contact fanpage certification welcome_content
                         facebook twitter youtube pinterest instagram google_plus
                         email phone zalo messenger
                         banner service
                       ]
  enum status: %i[disabled active]

  accepts_nested_attributes_for :banners, allow_destroy: true
  accepts_nested_attributes_for :services, allow_destroy: true
end
