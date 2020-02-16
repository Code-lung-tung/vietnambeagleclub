class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.belongs_to :dog
      t.string :title
      t.string :alt
      t.string :image

      t.timestamps
    end
  end
end
