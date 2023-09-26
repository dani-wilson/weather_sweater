class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: { require: true }
  validates :password_confirmation, presence: { require: true }

  has_secure_password
end
