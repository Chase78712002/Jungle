class User < ActiveRecord::Base

  


  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 3}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    stripped_downcase_email = email.strip.downcase
    @user = User.find_by_email(stripped_downcase_email)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end

  end
end
