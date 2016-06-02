class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :stay, index: true, foreign_key: true
      t.references :meal_type, foreign_key: true
      t.timestamps null: false
    end
  end
end
