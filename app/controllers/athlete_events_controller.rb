class AthleteEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
  end
end
