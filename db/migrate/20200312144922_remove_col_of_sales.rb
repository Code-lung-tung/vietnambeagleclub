class RemoveColOfSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :description
  end
end
