class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.string :slug
      t.integer :status, default: 1, limit: 1, null: false
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
