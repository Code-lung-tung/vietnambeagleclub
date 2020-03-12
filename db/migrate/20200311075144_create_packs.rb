class CreatePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.string :title
      t.text :description
      t.integer :display_order, default: 0, limit: 2
      t.integer :status, default: 1, limit: 1

      t.timestamps
    end
  end
end
