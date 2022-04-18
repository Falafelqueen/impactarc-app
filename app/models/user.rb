class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, length: {minimum: 6}
  validates :name, presence: true, length: { in: 4..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { casesensitive: false}


end
