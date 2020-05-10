class QuestionsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :ensure_correct_user, only: [:edit, :update, :destroy]
    def index
        if user_signed_in?
            @text = 'ようこそ、'+ current_user.name + 'さん'
        else
            @text = 'ご利用になるには、新規登録またはログインしてください'
        end
    end

    def show
        @question = Question.find(params[:id])
        @answer = Answer.new
    end

    def new
        @question = Question.new
    end

    def create
        #入力フォームからPOSTされた値を使ってインスタンスを作成し、@questionに代入
        @question = Question.new(question_params)
        @question.user_id = current_user.id
        if @question.save
            flash[:notice] = "保存しました"
            redirect_to("/questions/#{@question.id}") #DBへの保存が成功したら新規作成ページに戻る
        else
            flash.now[:alert] = "保存に失敗しました"
            render("questions/new")
        end
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
            flash[:notice] = "更新しました"
            redirect_to("/questions/#{@question.id}")
        else
            flash[:now] = "更新に失敗しました"
            render("questions/edit")
        end
    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        flash[:notice] = "削除しました"
        redirect_to("/questions")
    end

    private 
    def question_params
        params.require(:question).permit(:title, :body)
    end

    def ensure_correct_user
        @question = Question.find_by(id: params[:id])
        if @question.user_id != current_user.id
            flash[:alert] = "権限がありません"
            redirect_to("/questions/#{@question.id}")
        end

    end

    
end
