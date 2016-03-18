class EventStepsController < ApplicationController
  include Wicked::Wizard
  before_action :set_event, only: [:show, :update]
  steps :event_name, :event_address, :event_confirm

  def show
    render_wizard
  end

  def update
    @event.attributes = event_params
    render_wizard @event
  end

private
  def event_params
    params.require(:event).permit(:event_type_id, :name, :description, :event_date, :address, :state, :zip, :latitude, :longitude)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def redirect_to_finish_wizard(options = nil)
    flash[:success] = "Event was successfully created."
    redirect_to events_path
  end
end
