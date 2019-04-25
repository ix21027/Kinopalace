class CreateUserSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sessions do |t|
      t.string :time
      t.references :user, foreign_key: true
      t.string :coef

      t.timestamps
    end
  end
end
