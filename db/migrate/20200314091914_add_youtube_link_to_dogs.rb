class AddYoutubeLinkToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :youtube_link, :string
  end
end
