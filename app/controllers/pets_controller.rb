class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # ログインしていないユーザーはログインページへ

  def index
    @pets = Pet.all
  end  

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pets_path, notice: "ペットが登録されました"
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:pets_name, :kind_id, :sex_id, :birthday_id, :family_day_id, :image, :text)
  end
end