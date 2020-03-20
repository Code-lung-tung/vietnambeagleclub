class ChangeColsOfSales < ActiveRecord::Migration[5.2]
  def change
    change_table(:sales) do |t|
      t.remove :price_dow
      t.remove :title
      t.integer :sale_price
      t.references :dog
    end
  end
end
