class QuestionsAnswersController < ApplicationController
  def create
    @questions_answer = QuestionsAnswer.new(questions_answer_params)
    if @questions_answer.save
      redirect_to question_path(@questions_answer.question), notice: 'コメントを投稿しました。'
    else
      redirect_to question_path(@questions_answer.question), alert: 'コメントの投稿に失敗しました。'
    end
  end

  private

  def questions_answer_params
    params.require(:questions_answer).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end