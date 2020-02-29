class AddImageToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :image, :string, after: :title
  end
end
