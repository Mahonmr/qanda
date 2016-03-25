class AdminClubsController < ClubsController

  def index
    @clubs = Club.all
  end
end
