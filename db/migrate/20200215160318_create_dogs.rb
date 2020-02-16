class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.integer :father_id
      t.integer :mother_id
      t.string :name
      t.integer :sex, null: false, limit: 1, default: 0
      t.integer :color_type, limit: 1
      t.string :living_address
      t.text :description
      t.date :date_of_birth
      t.date :date_of_death

      t.timestamps
    end
  end
end
