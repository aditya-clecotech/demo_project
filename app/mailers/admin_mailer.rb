class AdminMailer < ApplicationMailer
   def cleanup_email
      mail to: "admin@gmail.com", subject: "Post CleanUp done successfully" 
   end
end
