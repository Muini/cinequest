class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :pseudo, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, length: { maximum: 255 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
  has_many :posts
end
