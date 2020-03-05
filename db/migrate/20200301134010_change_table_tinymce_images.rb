class ChangeTableTinymceImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :tinymce_images, :file_file_name
    remove_column :tinymce_images, :file_content_type
    remove_column :tinymce_images, :file_file_size
    remove_column :tinymce_images, :file_updated_at
    add_column :tinymce_images, :file, :string, after: :hint
  end
end
