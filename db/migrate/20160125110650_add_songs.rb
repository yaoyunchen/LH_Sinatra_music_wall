class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :author
      t.string :title
      t.string :url
      t.timestamps null: false
    end
  end
end