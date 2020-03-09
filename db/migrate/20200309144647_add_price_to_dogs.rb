class AddPriceToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :price, :integer
    add_column :dogs, :price_dow, :integer
  end
end
