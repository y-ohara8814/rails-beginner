class QuestionsController < ApplicationController
    def index
        @text = 'テキストテキスト'
    end

    def show
        @question = Question.find(params[:id])
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

    private 
    def question_params
        params.require(:question).permit(:title, :body)
    end
end
