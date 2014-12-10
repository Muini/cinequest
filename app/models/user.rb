class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :pseudo, presence: true, uniqueness: true, format: /\A[a-zA-Z0-9_]{3,25}\z/, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, length: { maximum: 255 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }

  default_scope -> { order('credits DESC') }
end
