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
      flash[:success] = "Votre quète à été ajouté !"
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
        format.html { render @post }
        format.js
      end
    else
      redirect_to :root
    end
  end
    
# Private
  private
    
  def post_params
    params.require(:post).permit(:url_img,:url_film,:hardlevel,:film_name)
  end

end
