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

  end
end
