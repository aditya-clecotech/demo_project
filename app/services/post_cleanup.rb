class PostCleanup

   def call 
      # Write query (or logic) here...
      inactive_post = Post.where(created_at: (Date.today - 6.month).all_day) #fetching all 6days old posts
      if inactive_post.destroy_all
         AdminMailer.cleanup_email.deliver
      end 
   end

end