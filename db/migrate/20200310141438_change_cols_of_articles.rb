class ChangeColsOfArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :type_of, :category
    remove_column :articles, :category_id
  end
end
