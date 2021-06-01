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
        expect(user.errors.full_messages).to include("Password can't be blank","Password confirmation can't be blank")
      end
    end

    context "Emails should be unique" do
      it "should not allow duplicate email address" do
        user1 = User.new(
          name: "Bruce",
          email: "test@test.Com",
          password: "123",
          password_confirmation: "123"
        )
        user1.save

        user2 = User.new(
          name: "Wayne",
          email: "TEST@TEST.com",
          password: "456",
          password_confirmation: "456"
        )
        user2.save

        expect(user2.errors.full_messages[0]).to eq("Email has already been taken")
      end
    end

    context "Email and name fields are required" do
      it "should require email field present" do
        user1 = User.new(
          name: "Bruce",
          email: nil,
          password: "123",
          password_confirmation: "123"
        )
        user1.save
        expect(user1.errors.full_messages[0]).to eq("Email can't be blank")
      end

      it "should require name field present" do
        user1 = User.new(
          name: nil,
          email: "test@test.com",
          password: "123",
          password_confirmation: "123"
        )
        user1.save
        expect(user1.errors.full_messages[0]).to eq("Name can't be blank")
      end
    end


  end
end
