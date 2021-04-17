class User < ApplicationRecord
  has_secure_password

  acts_as_paranoid

  validates :name,  presence: true
  validates :password, presence: true
  validates :api_token, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
end
