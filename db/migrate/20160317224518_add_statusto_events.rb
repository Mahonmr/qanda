class AddStatustoEvents < ActiveRecord::Migration
  def change
    add_column :events, :status, :boolean
  end
end
