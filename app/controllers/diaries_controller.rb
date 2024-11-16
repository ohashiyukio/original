class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      render :new
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:comment_text, :image, :pet_id)
  end
end
