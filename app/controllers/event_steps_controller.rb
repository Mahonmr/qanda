class EventStepsController < ApplicationController
  include Wicked::Wizard
  require 'date'
  @@mode = nil
  before_action :store_mode, only: [:show]
  before_action :create_mode?, only: [:show]
  before_action :set_event, only: [:show, :update]
  before_action :set_club, only: [:show, :update]
  steps :event_type, :event_name, :event_address, :event_confirm

  def show
    render_wizard
  end

  def update
    params[:event][:status] = step.to_s
    params[:event][:status] = 'active' if step == steps.last
    convert_date unless params[:event][:event_date].nil?  || params[:event][:event_date].empty?
    @event.attributes = event_params
    render_wizard @event
  end


private
  def event_params
    params.require(:event).permit(:event_type_id, :name, :description, :event_date, :city, :address, :state, :zip, :lat, :lng, :status)
  end

  def store_mode
    @@mode = params[:mode] unless params[:mode].nil?
  end

  def add_lat
    params[:lat]
  end

  def add_lng
    params[:lng]
  end

  def create_mode?
    @create_mode = @@mode == "create" ? true : false
  end

  def convert_date
    if (params[:event][:event_date].is_a? String)
      event_form_date = Date.strptime(params[:event][:event_date], "%m/%d/%Y")
      params[:event][:event_date] = event_form_date
    end
  end

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def redirect_to_finish_wizard(options = nil)
    flash[:success] = create_mode? ? "Event was successfully created." : "Event was successfully Updated."
    redirect_to club_events_path(@club)
  end
end
