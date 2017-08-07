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
      expect(@user.errors.full_messages).to eql ["First name can't be blank"]
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
      expect(@user.errors.full_messages).to eql ["Last name can't be blank"]
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
      expect(@user.errors.full_messages).to eql ["Email can't be blank"]
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
      expect(@user.errors.full_messages).to eql ["Password can't be blank", "Password is too short (minimum is 3 characters)"]
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
      expect(@user.errors.full_messages).to eql ["Password confirmation doesn't match Password"]
    end

    it "is not valid when email is already taken, case insensitive" do
      User.create!(
        first_name: "first-name",
        last_name: "last-name",
        email: "EMAIL@email.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Email has already been taken"]
    end

    it "is not valid when password is less than 3 characters long" do
      @user = User.new(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "ah",
        password_confirmation: "ah"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Password is too short (minimum is 3 characters)"]
    end
  end

  describe '#authenticate_with_credentials' do
    it "is valid when passed valid fields" do
      @user = User.create!(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user.authenticate_with_credentials("email@email.com", "12345")).to eql @user
    end

    it "is not valid when email is incorrect" do
      @user = User.create!(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user.authenticate_with_credentials("test@email.com", "12345")).to eql nil
    end

    it "is not valid when password is incorrect" do
      @user = User.create!(
        first_name: "first-name",
        last_name: "last-name",
        email: "email@email.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user.authenticate_with_credentials("email@email.com", "123")).to eql nil
    end
  end
end
