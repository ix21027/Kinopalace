class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :reserved_seats
      t.references :film, foreign_key: true
      t.string :time

      t.timestamps
    end
  end
end
