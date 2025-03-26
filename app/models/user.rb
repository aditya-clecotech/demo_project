class User < ApplicationRecord

   has_secure_password
   has_many :posts, dependent: :destroy
   validates :name, presence: true
   validates :email, presence: true, uniqueness: true
   validates :password, presence: true, confirmation: true
   validates :password_confirmation, presence: true
   validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
   

end
