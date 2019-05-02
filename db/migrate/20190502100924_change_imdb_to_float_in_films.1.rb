class ChangeImdbToFloatInFilms < ActiveRecord::Migration[5.2]
  def change
    change_column :films, :imdbRating, :float
  end
end
