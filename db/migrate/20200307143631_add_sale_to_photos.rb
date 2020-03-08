class AddSaleToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :sale, foreign_key: true
  end
end
