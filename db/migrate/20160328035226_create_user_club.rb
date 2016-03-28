class CreateUserClub < ActiveRecord::Migration
  def change
    create_table :user_clubs do |t|
      t.integer :manager_id
    end
  end
end
