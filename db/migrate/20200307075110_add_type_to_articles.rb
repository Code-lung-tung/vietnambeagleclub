class AddTypeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :type, :integer, default: 0
  end
end
