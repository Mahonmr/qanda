class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

      if @event.save
        flash[:success] = "Event successfully added!"
        redirect_to events_path
      else
        flash[:error] = "Event was not created!"
        render :new
      end
  end

  def update
      if @event.update(event_params)
        flash[:success] = "Event was successfully updated."
        redirect_to events_path
      else
        flash[:error] = "Event was not updated!"
        render :edit
      end
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
      params.require(:event).permit(:name, :description, :event_date, :address, :state, :zip, :latitude, :longitude)
    end
end
