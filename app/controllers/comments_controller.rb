class CommentsController < ApplicationController

# Commentaires

  def new
#    @comment = Comment.new 
  end
    
  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.create(comment_params)
    @new_comment[:user_id] = current_user.id
    if @new_comment.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Votre participation à été ajoutée !'
          redirect_to @post
        end
        format.js
      end
    else
      respond_to do |format|
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
        flash[:danger] = 'Participation supprimée.'
        redirect_to @post
      end
      format.js # JavaScript response
    end
  end

  def validate_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
    # validate again the post owner
    # just security
    if current_user.id == @post.user.id
      # Validate the participation & notify the post/quest
      @post.update_attribute(:found, true)
      @comment.update_attribute(:correct, true)
      # Yeah, give a credit to the winner
      credits = @comment.user.credits.to_i + 1 + @comment.post.difficulty.to_i
      @comment.user.update_attribute(:credits, credits)
      respond_to do |format|
        format.html do
          flash[:success] = 'Participation validée !'
          redirect_to @post
        end
        format.js
      end
    else
      respond_to do |format|
        redirect_to :root
      end
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
