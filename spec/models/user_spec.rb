require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Sign up Validation" do
    
    context "Password and password_confirmation fields are required" do
      it "should return error when password and confirmation don't match" do
        user = User.new(
          name: "Igudala",
          email: "andreig@mail.com",
          password: '123',
          password_confirmation: '456'
        )
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "should return error when password and confirmation not present" do
        user = User.new(
          name: "Igudala",
          email: "andreig@mail.com",
          password: nil,
          password_confirmation: nil
        )
        user.save
        p user.errors.full_messages
        expect(user.errors.full_messages).to include("Password can't be blank","Password confirmation can't be blank")
      end
    end


  end
end
