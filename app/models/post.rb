class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :url_img, presence: true
  validates :url_film, presence: true
  validates :film_name, presence: true
end