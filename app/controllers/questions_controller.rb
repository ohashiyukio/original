class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: '質問が作成されました。'
    else
      render :new
    end
  end

  def show
    @questions_answers = @question.questions_answers.includes(:user)
    @questions_answer = QuestionsAnswer.new
  end

  def search
    @questions = Question.search(params[:keyword])
    if @questions.count == 1
      redirect_to question_path(@questions.first)
    elsif @questions.empty?
      redirect_to questions_path, alert: '該当する質問は見つかりませんでした。'
    else
      render :search
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to root_path, alert: 'ログインが必要です。'
  end

  def question_params
    params.require(:question).permit(:symptoms, :progress, :medicine, :hospital, :habit,
                                     :favorite_food, :favorite_place, :image, :pet_id)
  end
end
