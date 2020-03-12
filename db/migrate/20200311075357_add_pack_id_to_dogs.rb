class AddPackIdToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :pack_id, :integer
  end
end
