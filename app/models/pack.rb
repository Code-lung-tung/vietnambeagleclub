class Pack < ApplicationRecord
  enum status: %i[disabled active]

  validates :title, length: { maximum: 355 }, presence: true

  has_many :dogs

  def in_sale_dogs
    dogs.select { |dog| dog.sale.present? }
  end
end
