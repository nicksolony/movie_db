class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.belongs_to :genre
      t.belongs_to :director, :class_name => 'Person'
      t.belongs_to :writer, :class_name => 'Person'
      t.date :release_date

      t.timestamps
    end
  end
end
