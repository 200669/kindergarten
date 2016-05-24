class CreateMealTypes < ActiveRecord::Migration
  def change
    create_table :meal_types do |t|
      t.integer :ordinal
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
