class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @user = User.find(params[:id])
    @post = Post.new
  end

  def create
    # @user = User.find(params[:id])
    @post = Post.new(post_params)
    if @post.save 
      redirect_to root_path, notice: "Post created successfully"
    else 
      render :new, alert: "something went wrong, while creating post!" 
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      if @post.destroy
        flash[:notice] = 'Post was successfully deleted.'
        redirect_to posts_url
      else
        flash[:alert] = 'Something went wrong'
        redirect_to posts_url
      end
    else 
      flash[:alert] = 'You are not authorized to delete this post!'
      redirect_to @post
    end 
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
  
end
