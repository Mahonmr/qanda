class ClubsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  def index
    @clubs = Club.all
  end

  def show
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to clubs_path
      flash[:success] = 'Club was successfully created.'
    else
      flash[:error] = 'Club was not created.'
      render :new
    end
  end

  def update
    if @club.update(club_params)
      flash[:success] = 'Club was successfully Updated.'
      redirect_to clubs_path
    else
      flash[:success] = 'Club was not Updated.'
      ender :edit
    end
  end

  def destroy
    if @club.destroy
    flash[:success] = 'Club was successfully deleted.'
    redirect_to clubs_path
    else
      flash[:error] = "There was a problem deleting club #{@club.name}."
      redirect_to clubs_path
    end
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :logo)
    end
end
