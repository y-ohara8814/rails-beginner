require 'rails_helper'

RSpec.describe Question, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @question = Question.create(
      title: "test question title",
      body: "test question body"
    )
    # @question = create(:question)
  end

  it "is invalid without title" do
    @question.title = nil
    @question.valid?
    expect(@question.errors[:title]).to include("can't be blank")
  end

  it "is invalid without body" do
    @question.body = nil
    @question.valid?
    expect(@question.errors[:body]).to include("can't be blank")

  end
end
