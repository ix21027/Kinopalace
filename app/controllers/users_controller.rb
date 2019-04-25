class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def edit
    @user = User.find current_user.id
  end

  def update
    @user = User.find current_user.id
  
    if FilmList.new(@user, params).build
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
end
