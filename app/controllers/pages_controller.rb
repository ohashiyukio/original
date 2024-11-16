class PagesController < ApplicationController
  def index
    @diaries = Diary.order(created_at: :desc).page(params[:page]).per(10)
    @questions = Question.order(created_at: :desc).page(params[:page]).per(10)
  end
end
