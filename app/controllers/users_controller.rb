class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:my_page]
  
  def my_page
    @pets = current_user.pets
  end
end
