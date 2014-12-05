class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
    
  validates :message, presence: true, length: { minimum: 3, maximum: 140 }

  default_scope -> { order('created_at ASC') }
end
