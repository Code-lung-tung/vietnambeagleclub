class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.integer :site_setting_id
      t.string :title
      t.integer :status, default: 1, limit: 1, null: false
      t.string :link
      t.string :alt
      t.string :image


      t.timestamps
    end
  end
end
