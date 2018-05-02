class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.string :description
      t.string :duration
      t.string :genre
      t.string :times

      t.timestamps
    end
  end
end
