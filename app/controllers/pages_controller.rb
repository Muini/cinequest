class PagesController < ApplicationController
  skip_before_action :require_login, only: [ :home, :index ]
    
  def home
    
  end
    
  def index
#    unless logged_in?
#      redirect_to :home
#    end
    @posts = Post.all.where(closed: false) #Not all post, all not closed post
  end
end
