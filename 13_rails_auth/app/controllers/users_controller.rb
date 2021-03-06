class UsersController < ApplicationController

  # Sign up Process - new, create, show

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
