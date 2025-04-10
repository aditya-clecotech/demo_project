class Subscription < ApplicationRecord
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "id", "id_value", "posts_allowed", "stripe_price_id", "updated_at", "user_id"]
  end
end
