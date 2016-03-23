class EventTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event_type, only: [:show, :edit, :update, :destroy]

  def index
    @event_types = EventType.all
  end

  def show
  end

  def new
    @event_type = EventType.new
  end

  def edit
  end

  def create
    @event_type = EventType.new(event_type_params)

      if @event_type.save
        flash[:success] = "Event Type successfully added!"
        redirect_to event_types_path
      else
        flash[:error] = "Event Type was not created!"
        render :new
      end
  end

  def update
      if @event_type.update(event_type_params)
        flash[:success] = "Event Type successfully updated!"
        redirect_to event_types_path
      else
        flash[:error] = "Event Type was not updated!"
        render :edit
      end
  end

  def destroy
    if @event_type.destroy
      flash[:error] = "Event Type was not deleted!"
      redirect_to event_types_path
    else
      flash[:error] = "Event Type was not deleted!"
      redirect_to event_types_path
    end
  end

  private
    def set_event_type
      @event_type = EventType.find(params[:id])
    end

    def event_type_params
      params.require(:event_type).permit(:name, :image_url)
    end
end
