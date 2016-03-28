require 'rails_helper'

feature "The Admin dashboard" do
  let(:user)   { create(:user, :admin) }
  let!(:club)   { create(:club) }


  scenario "Admin signs in and gets redirected to their dashboard" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "WetKittyFood"
    click_button "Log in"
    expect(current_path).to eq admins_path
    expect(page).to have_content "Signed in as #{user.full_name}"
    expect(page).to have_content "#{club.name}"
  end
end
