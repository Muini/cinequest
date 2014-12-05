class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
    
  validates :message, presence: true, length: { minimum: 3, maximum: 140 }
end
