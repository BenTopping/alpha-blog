require 'rails_helper'

describe Article do
    context "upon article creation" do
        let!(:user) {User.create(username:"username1", email:"ben.topping@example.com", password: "password")}
        let!(:article) {Article.new(title: "valid title", description: "Filler description", user_id: user.id)}

        it "must create with valid parameters" do
            expect(article.save).to eq(true)
        end

        it "must have a valid title" do
            article.title = ""
            expect(article.save).to eq(false)
        end

        it "must have a valid description" do
            article.description = ""
            expect(article.save).to eq(false)
        end
        
        it "must have a valid user" do
            article.user_id = ""
            expect(article.save).to eq(false)
        end

    end
end