class AddColsToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :microchip_number, :string, after: :color_type
    add_column :dogs, :owner, :string, after: :living_address
  end
end
