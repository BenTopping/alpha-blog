require 'rails_helper'

describe SessionsController do
    context "upon session creation" do
        it "renders home page on sign in" do
            @user = User.create(username:"bentopp", email:"bentopp@example.com", password: "password")
            get :create
            expect(response).to redirect_to(user_path(@user))
        end
    end
end