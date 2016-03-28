class AddUserRreferencesAndClubReferenceToUserClubs < ActiveRecord::Migration
  def change
    add_reference :user_clubs, :club, index: true, foreign_key: true
    add_reference :user_clubs, :user, index: true, foreign_key: true
  end
end

