class CreateAddTitleToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :title, :string, after: :name
  end
end
