class RemoveSlugOfSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :slug
  end
end
