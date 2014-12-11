class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  before_save { self.difficulty = difficulty.to_i }
  validates :url_img, presence: true, format: /.(png|jpg)\Z/
  validates :url_film, presence: true, format: /vodkaster\.com\/films/i
  validates :film_name, presence: true
  validates :clue, length: { maximum: 260 }

  default_scope -> { order('created_at DESC') }
    
  def day_end
    render.js{"alert('Yolo');"}
    puts "=============="
    puts "END OF THE DAY"
    puts "=============="
  end
end
