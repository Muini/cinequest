class User < ActiveRecord::Base
  validates :pseudo, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :mdp, presence: true, length: { maximum: 20 }
end
