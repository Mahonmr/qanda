class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show

  end


  def new
     @event = Event.new

    # session[:event_params] ||= {}
    # @event = Event.new(session[:event_params])
    # binding.pry
    # @event.current_step = session[:event_step]
  end

  def edit
  end

  def create
@event = Event.new
@event.current_step = session[:event_step]
if params[:back_button]
  @event.previous_step
else
  @event.next_step
end
session[:event_step] = @event.current_step
render "new"
  end



  # session[:event_params].params[:event] if params[:event]
  # @event = Event.new(session[:event_params])
  # if @event.valid?
  #   if params[:back_button]
  #     @event.previous_step
  #   elsif @event.last_step?
  #     @event.save if @event.all_valid?
  #   else
  #     @event.next_step
  #   end
  #   session[:event_step] = @event.current_step
  # end
  # if @event.new_record?
  #   render "new"
  # else
  #   session[:event_step] = session[:event_params] = nil
  #   flash[:success] = "Event successfully added!"
  #   redirect_to @event
    # ======
    # @event = Event.new(event_params)

    #   if @event.save
    #     flash[:success] = "Event successfully added!"
    #     redirect_to events_path
    #   else
    #     flash[:error] = "Event was not created!"
    #     render :new
    #   end


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


