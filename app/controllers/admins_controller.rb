class AdminsController < ApplicationController

  def index
    @clubs = Club.all
  end
end
