class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.belongs_to :genre, foreign_key: true
      t.belongs_to :director, :class_name => 'Person', foreign_key: true
      t.belongs_to :writer, :class_name => 'Person', foreign_key: true
      t.date :release_date

      t.timestamps
    end
  end
end
