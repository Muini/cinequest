class CommentsController < ApplicationController

# Commentaires

  def new
    @comment = Comment.new 
  end
    
  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.create(comment_params)
    @new_comment[:user_id] = current_user.id
    if @new_comment.save
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
        flash[:success] = 'Participation supprimée.'
        redirect_to @post
      end
      format.js # JavaScript response
    end
  end

  def validate_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.update_attribute(:found, true)
    @comment.update_attribute(:closed, true)
    credits = @comment.user.credits + 1
    @comment.user.update_attribute(:credits, credits)
    respond_to do |format|
      format.html do
        flash[:success] = 'Participation validée !'
        redirect_to @post
      end
      format.js
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
