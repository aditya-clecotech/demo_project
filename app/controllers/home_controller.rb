class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
end

# if current_user&.subscription&.active?
#   if current_user.subscription.posts_allowed.nil?
#     @posts = Post.all
#   else
#     @posts = Post.limit(current_user.subscription.posts_allowed)
#   end
# elsif current_user.present?
#   redirect_to new_payment_path, alert: "Please subscribe to view posts"
# else
#   @posts = [] # or show some public content or teaser here
# end





# if current_user.subscription&.active?
#   if current_user.subscription.posts_allowed.nil?
#     @posts = Post.all
#   else
#     @posts = Post.limit(current_user.subscription.posts_allowed)
#   end
# else
#   redirect_to new_payment_path, alert: "Please subscribe to view posts"
# end