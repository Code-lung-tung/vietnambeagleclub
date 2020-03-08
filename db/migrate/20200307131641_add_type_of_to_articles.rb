class AddTypeOfToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :type_of, :integer, default: 0
  end
end
