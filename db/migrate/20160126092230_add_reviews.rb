class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.text :review
      t.integer :rating, default: 0
      t.timestamps null: false
    end
  end
end