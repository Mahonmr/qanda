class EventsController < ApplicationController
  include EventsHelper
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show

  end


  def new
    @event = Event.new
    create
  end

  def edit
    update
  end

  def create
    @event = Event.new
    if @event.save(validate: false)
      redirect_to event_steps_path(event_id: @event.id, mode: "create")
    else
      flash[:error] = "Event was not created!"
      render :index
    end
  end

  def update
    redirect_to event_steps_path(event_id: @event.id, mode: "edit")
  end

  def destroy
    if @event.destroy
      flash[:success] = "Event was deleted"
    else
      flash[:success] = "There was a problem deleting the event #{@event.name}"
    end
      redirect_to events_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event_type_id, :name, :description, :event_date, :address, :state, :zip, :latitude, :longitude)
    end
end
