class PostsController < ApplicationController
#  scope :found, -> { where(found: true) } # chained function to draw founded posts
    
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
    @comment = @post.comments.new
  end
    
# Private
  private
    
  def post_params
    params.require(:post).permit(:url_img,:url_film,:hardlevel,:film_name)
  end

end
