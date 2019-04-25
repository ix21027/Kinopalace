class AddAgeRatingToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :age_rating, :string
  end
end
