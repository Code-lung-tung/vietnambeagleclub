class Sale < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :price, presence: true

  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes[:image].blank? },
    allow_destroy: true
end
