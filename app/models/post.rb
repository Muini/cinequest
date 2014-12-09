class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :url_img, presence: true, format: /.(png|jpg)\Z/
  validates :url_film, presence: true, format: /vodkaster\.com\/films/i
  validates :film_name, presence: true

  default_scope -> { order('created_at DESC') }
end
