class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  before_save { self.difficulty = difficulty.to_i }
  validates :url_img, presence: true, format: /.(png|jpg)\Z/
  validates :url_film, presence: true, format: /allocine\.fr\/film/i
  validates :film_name, presence: true, length: { minimum: 1, maximum: 255 }
  validates :clue, length: { maximum: 260 }

  default_scope -> { order('created_at DESC') }
    
#  def day_end
#    puts "=============="
#    puts "END OF THE DAY"
#    puts "=============="
#  end
end
