class Color < ApplicationRecord
  validates :name, length: { maximum: 355 }, presence: true
end
