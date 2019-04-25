class CreateAgeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :age_ratings do |t|
      t.string :coef
      t.references :user, foreign_key: true
      t.string :rating

      t.timestamps
    end
  end
end
