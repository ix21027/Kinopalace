class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users_film_lists, :R, :rating
  end
end
