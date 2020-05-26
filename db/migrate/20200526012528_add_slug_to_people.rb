class AddSlugToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :slug, :string
  end
end
