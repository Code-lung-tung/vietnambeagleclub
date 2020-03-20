class CreateSiteSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :site_settings do |t|
      t.integer :status, limit: 1, default: 1, null: false
      t.integer :setting_type, limit: 1, null: false
      t.text :value

      t.timestamps
    end
  end
end
