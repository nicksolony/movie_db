class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :character, foreign_key: true
      t.text :comment, null: false
      t.integer :rating

      t.timestamps
    end
  end
end
