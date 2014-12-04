class Rush < ActiveRecord::Base
  validates :date_d, presence: true
  validates :date_f, presence: true
end
