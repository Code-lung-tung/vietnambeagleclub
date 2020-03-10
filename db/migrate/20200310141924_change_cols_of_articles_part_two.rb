class ChangeColsOfArticlesPartTwo < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :published_at
    change_column :articles, :category, :integer, before: :title
  end
end
