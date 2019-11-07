require 'rails_helper'

describe User do
    context "upon account creation" do
        let!(:user) {User.new(username: "random", email: "ben.topping@hotmail.com", password: "password")}
        
        it "must create with valid parameters" do 
            expect(user.save).to eq(true)
        end
        
        it "checks account must have valid email" do
            user.email = "benEmail"
            expect(user.save).to eq(false)
        end

        it "checks account must have valid username" do
            user.username = ""
            expect(user.save).to eq(false)
        end

        it "checks account must have valid password" do
            user.password = " "
            expect(user.save).to eq(false)
        end
    end
end