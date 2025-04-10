class Plan < ApplicationRecord

   def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "id_value", "name", "posts_allowed", "price_in_rupees", "stripe_price_id", "stripe_product_id", "updated_at"]
   end

end
