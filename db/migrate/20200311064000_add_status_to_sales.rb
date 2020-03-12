class AddStatusToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :status, :integer, limit: 1, default: 1
  end
end
