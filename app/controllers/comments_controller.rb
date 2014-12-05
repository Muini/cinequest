class CommentsController < ApplicationController

# Commentaires
    
def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.build(comment_params)
  @comment.quother = true if logged_in?
  if @comment.save
    @new_comment = @post.comments.new
    respond_to do |format|
      format.html do
        flash[:success] = 'Participation posté !'
        redirect_to @post
      end
      format.js
    end
  else
    @new_comment = @comment
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

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
    
end
