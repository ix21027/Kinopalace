class CreateUsersFilmLists < ActiveRecord::Migration[5.2]
  def change
    create_table :users_film_lists do |t|
      t.belongs_to :film, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :R

      t.timestamps
    end
  end
end
