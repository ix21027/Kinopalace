class CreateChangeRatingToFloatInUsersFilmLists < ActiveRecord::Migration[5.2]
  def change
    change_column :users_film_lists, :rating, :float
  end
end
