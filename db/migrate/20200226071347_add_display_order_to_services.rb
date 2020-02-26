class AddDisplayOrderToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :display_order, :integer, after: :image, limit: 1, default: 1
  end
end
