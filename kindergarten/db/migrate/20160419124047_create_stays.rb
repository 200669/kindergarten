class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.timestamp :start
      t.timestamp :end
      t.references :child, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
