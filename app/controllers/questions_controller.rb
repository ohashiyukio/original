class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    Rails.logger.debug "Current User's Pets: #{current_user.pets.inspect}"
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

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:symptoms, :progress, :medicine, :hospital, :habit, 
                                      :favorite_food, :favorite_place, :image, :pet_id)
  end  
end