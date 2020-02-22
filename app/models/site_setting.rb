class SiteSetting < ApplicationRecord
  has_many :banners, dependent: :destroy

  enum setting_type: %i[
                         site_title site_logo google_map about_me policy contact fanpage certicication
                         facebook twitter youtube pinterest instagram
                         email phone zalo messenger
                         banner
                       ]
  enum status: %i[disabled active]

  accepts_nested_attributes_for :banners, reject_if: proc { |attributes| attributes[:image].blank? },
    allow_destroy: true
end
