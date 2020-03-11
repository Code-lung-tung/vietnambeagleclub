class Sale < ApplicationRecord
  belongs_to :dog
  validates :price, presence: true

  enum status: %i[out_of_stock in_stock]

  class << self
    def show_column_names
      %i[price sale_price status description created_at updated_at]
    end
  end
end
