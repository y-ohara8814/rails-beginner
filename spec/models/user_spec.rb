require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = User.create(
      name: "Sumner",
      email: "tester@example.com",
      password: "abcdefg"
    )
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a name, email, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do  
    # user = User.new(name: nil)
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    # User.create(
    #   name: "joe",
    #   email: "tester@example.com",
    #   password: "11111111"
    # )
    FactoryBot.create(:user ,email: "abc@example.com")
    user = FactoryBot.build(:user, email: "abc@example.com")
    # user2 = User.new(
    #   name: "tod",
    #   email: "tester@example.com",
    #   password: "11111111"
    # )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end


  
end
