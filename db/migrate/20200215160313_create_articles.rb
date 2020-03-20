class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.belongs_to :category
      t.string :photo, null: false
      t.string :title, null: false
      t.text :content
      t.integer :status, default: 0, limit: 1, null: false, comment: 'draft, published, inactive'
      t.string :slug
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.datetime :published_at

      t.timestamps
    end
  end
end
