class FilmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @films = Film.all
    @user = current_user
    if @user
      FilmList.new(current_user).build 
      @list = current_user.users_film_list
    end
  end
 
  def show
    @film = Film.find(params[:id])
    if @film.nil?
      @films = Film.all
      flash.now[:alert] = "Your film was not found"
      render "index"
    end
  end
  
  def book
    @session_id = Session.find_by(time: params[:time])
  end

end



