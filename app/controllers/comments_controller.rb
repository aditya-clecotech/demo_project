class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id 
    if @comment.save 
      redirect_to @post , notice: "Comment was successfully added"
    else 
      flash[:alert] = "Something went wrong, while creating comment"
    end 
  end

  private 
  def comment_params
    params.require(:comment).permit(:content)
  end
end
