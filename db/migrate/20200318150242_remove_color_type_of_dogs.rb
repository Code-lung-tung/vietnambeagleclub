class RemoveColorTypeOfDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :color_type
  end
end
