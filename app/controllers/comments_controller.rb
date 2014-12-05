class CommentsController < ApplicationController

# Commentaires

  def new
    @comment = Comment.new 
  end
    
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment[:user_id] = current_user.id
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Your comment has been posted.'
          redirect_to @post
        end
        format.js
      end
    else
      respond_to do |format|
        format.html { render @post }
        format.js { render action: 'failed_save' }
      end
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Participation supprimé.'
        redirect_to @post
      end
      format.js # JavaScript response
    end
  end

  def index
    # created in order to handle renders from this controller, which produce URL 'root/posts/:id/comments'
    post = Post.find(params[:post_id])
    redirect_to post
  end   
    
    
  private

  def comment_params
    params.require(:comment).permit(:message)
  end
    
end
