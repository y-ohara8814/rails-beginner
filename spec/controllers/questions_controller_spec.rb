require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    describe "#index" do
        context "as an authenticated user" do
            before do
                @user = FactoryBot.create(:user)
                # @question = create(:question, user: @user)
            end

            it "responds successfully" do
                sign_in @user
                get :index
                expect(response).to be_successful
            end

            it "returns a 200 responce" do
                sign_in @user
                get :index
                expect(response).to have_http_status "200"
            end
        end

        context "as a guest" do

            it "returns a 302 response when access edit page with authenticated id" do

            end

            it "redirects to the question page" do
                
            end
        end
    end
end
