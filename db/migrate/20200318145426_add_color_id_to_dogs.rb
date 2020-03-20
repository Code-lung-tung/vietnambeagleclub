class AddColorIdToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :color_id, :integer
  end
end
