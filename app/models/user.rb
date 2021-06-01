class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 3}
  validates :password_confirmation, presence: true
end
