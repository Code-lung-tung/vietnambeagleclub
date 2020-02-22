class CreateTinymceImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tinymce_images do |t|
      t.string     :alt,  default: ""
      t.string     :hint, default: ""
      t.attachment :file

      t.timestamps
    end
  end
end
