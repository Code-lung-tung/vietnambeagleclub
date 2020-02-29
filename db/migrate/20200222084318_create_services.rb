class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :site_setting_id
      t.string :title, null: false
      t.text :content
      t.integer :status, default: 1, null: false, limit: 1

      t.timestamps
    end
  end
end
