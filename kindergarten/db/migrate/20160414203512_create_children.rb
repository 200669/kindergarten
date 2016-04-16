class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.date :birthdate, null: false
      t.string :pesel, null: false, limit: 11, uniq: true
      t.string :barcode, null: false, uniq: true

      t.timestamps null: false
    end
  end
end
