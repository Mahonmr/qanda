require 'rails_helper'

RSpec.describe ClubsController, type: :controller do

  describe Event do
    it 'Testing' do
      binding.pry
      event = FactoryGirl.create(:event)
    end
  end
end

