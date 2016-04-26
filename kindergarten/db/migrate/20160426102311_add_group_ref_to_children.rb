class AddGroupRefToChildren < ActiveRecord::Migration
  def change
    add_reference :children, :group, index: true, foreign_key: true
  end
end
