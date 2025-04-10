class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comments = @post.comments #all comments of that perticular @post
    @comment = @post.comments.build #model of creating comment
  end

  def new
    if current_user&.subscription&.active?
      if current_user.subscription.posts_allowed.nil?
        @post = current_user.posts.new
      elsif current_user.posts.count < current_user.subscription.posts_allowed
        @post = current_user.posts.new
      else
        flash[:alert] = "Post creating limit exceeded!!"
        redirect_to posts_path
      end 
    else 
      redirect_to new_payment_path
    end 
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save 
      redirect_to root_path, notice: "Post created successfully"
    else 
      flash[:alert] = "something went wrong, while creating post!" 
      render :new
    end 

    # if current_user&.subscription&.active?
    #   if current_user.subscription.posts_allowed.nil?
    #     @post = current_user.posts.new(post_params)
    #     if @post.save 
    #       redirect_to root_path, notice: "Post created successfully"
    #     else 
    #       flash[:alert] = "something went wrong, while creating post!" 
    #       render :new
    #     end 
    #   elsif current_user.posts.count <= current_user.subscription.posts_allowed
    #     @post = current_user.posts.new(post_params)
    #     if @post.save 
    #       redirect_to root_path, notice: "Post created successfully"
    #     else 
    #       flash[:alert] = "something went wrong, while creating post!" 
    #       render :new
    #     end 
    #   else
    #     flash[:alert] = "Members only! Please buy subscription..."
    #     redirect_to root_path
    #   end 
    # end 
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
