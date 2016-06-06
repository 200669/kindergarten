class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :child, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :period_begin
      t.datetime :period_end

      t.timestamps null: false
    end
  end
end
