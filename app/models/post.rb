class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :url_img, presence: true
  validates :url_film, presence: true
  validates :film_name, presence: true

  default_scope -> { order('created_at DESC') }
end
