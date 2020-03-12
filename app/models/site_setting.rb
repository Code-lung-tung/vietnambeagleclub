class SiteSetting < ApplicationRecord
  has_many :banners, dependent: :destroy
  has_many :services, dependent: :destroy

  enum setting_type: {
    site_title: 0,
    site_logo: 1,
    google_map: 2,
    about_me: 3,
    policy: 4,
    contact: 5,
    fanpage: 6,
    certification: 7,
    welcome_content: 8,
    sidebar_address: 9,
    facebook: 10,
    twitter: 11, 
    youtube: 12, 
    pinterest: 13,
    instagram: 14, 
    google_plus: 15,
    # email: 16,
    # phone: 17,
    # zalo: 18,
    messenger: 19
    # banner: 20,
    # service: 21
  }
  enum status: %i[disabled active]

  # accepts_nested_attributes_for :banners, allow_destroy: true
  # accepts_nested_attributes_for :services, allow_destroy: true
end
