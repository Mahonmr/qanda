class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :event_date
      t.string :address
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
