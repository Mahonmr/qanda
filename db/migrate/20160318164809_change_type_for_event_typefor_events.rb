class ChangeTypeForEventTypeforEvents < ActiveRecord::Migration
  def change
    rename_column :events, :event_type_id, :event_type
    change_column :events, :event_type, :string
  end
end
