class RemoveColumnReleasedateFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :release_date
    add_column :movies, :release_date, :integer

  end
end
