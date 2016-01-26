class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.belongs_to :user
      t.string :title
      t.string :url
      t.timestamps null: false
    end
  end
end