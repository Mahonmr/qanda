class HomeController < ApplicationController

  def index
    redirect_to_user_dashboard and return unless current_user.nil?
  end

  def admin
    redirect_to clubs_path
  end

  def manager
    redirect_to club_path(current_user.club)
  end

  def athlete
  end
end
