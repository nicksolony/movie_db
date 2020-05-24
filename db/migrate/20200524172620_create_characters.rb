class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :movie, null: false
      t.belongs_to :actor, :class_name => 'Person'
      t.string :name

      t.timestamps
    end
  end
end
