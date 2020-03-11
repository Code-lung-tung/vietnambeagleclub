class RemoveColsOfDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :price
    remove_column :dogs, :price_dow
    remove_column :dogs, :title
  end
end
