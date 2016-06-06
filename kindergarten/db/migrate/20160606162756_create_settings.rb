class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.time :free_stay_begin
      t.time :free_stay_end
      t.float :stay_price_per_hour

      t.timestamps null: false
    end
  end
end
