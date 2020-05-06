class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        # @questions = Question.where(user_id: @user.id)
    end


end
