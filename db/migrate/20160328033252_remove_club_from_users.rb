class RemoveClubFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :club, index: true, foreign_key: true
  end
end
