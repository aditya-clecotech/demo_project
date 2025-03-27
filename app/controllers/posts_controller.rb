class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save 
      redirect_to root_path, notice: "Post created successfully"
    else 
      flash[:alert] = "something went wrong, while creating post!" 
      render :new
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
    params.require(:post).permit(:title, :content)
  end
  
end
