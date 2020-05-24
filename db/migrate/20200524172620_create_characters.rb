class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
