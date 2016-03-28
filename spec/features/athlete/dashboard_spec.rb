require 'rails_helper'

feature "The athlete dashboard" do
  let(:user)   { create(:user, :athlete) }


  scenario "Athletes Signs in and gets redirect to thier dashboard" do
    binding.pry
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "WetKittyFood"
    click_button "Log in"
    expect(current_path).to eq athlete_events_path(user)
    expect(page).to have_content 'Events'
  end
end
