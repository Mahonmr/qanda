class ChangStatusTypeOnEvents < ActiveRecord::Migration
  def change
    change_column :events, :status, :string
  end
end
