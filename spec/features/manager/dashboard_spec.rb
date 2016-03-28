require 'rails_helper'

feature "The Manager Dashboard" do
  let!(:club)   { create(:club) }
  let!(:user)   { create(:user, :manager, club: club) }


  scenario "Manager signs in and gets redirected to their dashboard" do
    binding.pry
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "WetKittyFood"
    click_button "Log in"
    expect(current_path).to eq manager_club_path(user, @manager.club)
    expect(page).to have_content "Signed in as #{user.full_name}"
  end
end
