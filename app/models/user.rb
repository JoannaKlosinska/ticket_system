class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  has_many :tickets
end