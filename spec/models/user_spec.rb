require "rails_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with all attributes" do
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to be_valid
    end

    it "is not valid without a first_name" do
      @user = User.new(
        first_name: nil,
        last_name: "last-name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to_not be_valid
      expect{ raise StandardError, "can't be blank" }.to raise_error("can't be blank")
    end

    it "is not valid without a last_name" do
      @user = User.new(
        first_name: "first-name",
        last_name: nil,
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to_not be_valid
      expect{ raise StandardError, "can't be blank" }.to raise_error("can't be blank")
    end

    it "is not valid without an email" do
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(@user).to_not be_valid
      expect{ raise StandardError, "can't be blank" }.to raise_error("can't be blank")
    end

    it "is not valid when both password and password_confirmation are empty" do
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: nil,
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
      expect{ raise StandardError, "can't be blank" }.to raise_error("can't be blank")
    end

    it "is not valid when password and password_confirmation do not match" do
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "1234",
        password_confirmation: "12345"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql  ["Password confirmation doesn't match Password"]
    end
  end
end
