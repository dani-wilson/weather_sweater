class User < ApplicationRecord
  validates_presence_of :email, :password, :password_confirmation
end
