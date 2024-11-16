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
      redirect_to root_path, notice: 'ペットが登録されました'
    else  
      flash.now[:alert] = "登録に失敗しました。必要な項目を入力してください。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:pets_name, :kind, :sex_id, :birthday_id, :family_day_id, :image)
  end
end
