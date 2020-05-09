class AnswersController < ApplicationController
    before_action :authenticate_user!

    def create
        @answer = Answer.new(answer_params)
        @answer.user_id = current_user.id
        @answer.question_id = params[:question_id]
        if @answer.save
            flash[:notice] = "回答しました"
            redirect_to("/questions/#{params[:question_id]}")
        else
            @question = Question.find(params[:question_id])
            flash[:alert] = "回答の保存に失敗しました"
            render "questions/show"
        end
    end

    private
    def answer_params
        params.require(:answer).permit(:body)
    end
end
