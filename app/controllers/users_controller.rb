class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully registered."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "There is a problem with your username or password."
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

