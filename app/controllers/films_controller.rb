class FilmsController < ApplicationController
  
  def index
    @films = Film.all
  end
 
  def show
    @film = Film.find(params[:id])
    if @film.nil?
      @films = Film.all
      flash.now[:alert] = "Your film was not found"
      render "index"
    end
  end

end



