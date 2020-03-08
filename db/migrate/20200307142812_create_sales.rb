class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :title
      t.integer :price
      t.integer :price_dow
      t.text :description

      t.timestamps
    end
  end
end
