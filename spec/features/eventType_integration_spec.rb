require 'rails_helper'

describe "adding a new event type" do
  it "adds a new event type" do
    visit event_types_path
    click_link 'New Event type'
    fill_in 'Name', :with => 'New Event Type'
    fill_in 'Image url', :with => 'New Event Type URL'
    click_on 'Create Event type'
    expect(page).to have_content 'New Event Type'
  end
end
