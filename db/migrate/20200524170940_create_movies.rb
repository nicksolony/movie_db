class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.belongs_to :genre, null: false, foreign_key: true
      t.belongs_to :director, :class_name => 'Person', null: false, foreign_key: true
      t.belongs_to :writer, :class_name => 'Person', null: false, foreign_key: true
      t.date :release_date

      t.timestamps
    end
  end
end
