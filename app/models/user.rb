class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :username, uniqueness: {case_sensitive: false},
             presence: true, length: {minimum: 3, maximum:20};
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false},
             presence: true, length: {maximum:100},
             format: { with: VALID_EMAIL_REGEX }
  validates :password, length: {minimum:3, maximum:20}
  has_secure_password
end
