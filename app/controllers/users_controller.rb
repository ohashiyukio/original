class UsersController < ApplicationController
  def my_page
    @pets = current_user.pets
  end
end
