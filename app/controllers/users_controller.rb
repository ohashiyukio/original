class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_page
    @user = User.find(params[:id])
    @pets = @user.pets
  end

  def show
    @user = User.find(params[:id])
  end
end
