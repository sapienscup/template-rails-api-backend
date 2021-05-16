class Account < ApplicationRecord
  has_secure_password

  acts_as_paranoid

  acts_as_token_authenticatable

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

  has_one :account_profile
  has_one :profile, through: :account_profile

  has_one :admin

  devise :lockable, :timeoutable
end
