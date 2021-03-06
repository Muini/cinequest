class PostsController < ApplicationController
#  scope :found, -> { where(found: true) } # chained function to draw founded posts
  skip_before_action :require_login, only: [ :show ]
    
# Quète creation
  def new
    @post = Post.new
  end
    
  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user.id
    if @post.save
      flash[:success] = "Votre quète à été ajoutée !"
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = @post.comments.new
    
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      flash[:error] = "Ce chemin est indisponible."
      redirect_to :root
    end
  end
    
# Private
  private
    
  def post_params
    params.require(:post).permit(:url_img,:url_film,:difficulty,:film_name,:clue)
  end

end
