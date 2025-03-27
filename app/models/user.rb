class User < ApplicationRecord

   has_secure_password
   has_many :posts, dependent: :destroy
   validates :name, presence: true
   validates :email, presence: true, uniqueness: true
   validates :password, presence: true, confirmation: true
   validates :password_confirmation, presence: true
   validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
   
   def self.ransackable_associations(auth_object = nil)
      ["posts"]
    end

   def self.ransackable_attributes(auth_object = nil)
      ["created_at", "email", "id", "id_value", "name", "password_digest", "updated_at"]
   end
   
end
