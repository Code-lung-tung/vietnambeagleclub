class AddSlugToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :slug, :string
  end
end
