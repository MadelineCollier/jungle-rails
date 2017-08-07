class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 3 }

  def authenticate_with_credentials(email, password)
    @email = email.strip
    @user = User.where('lower(email) = ?', @email.downcase).first
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end