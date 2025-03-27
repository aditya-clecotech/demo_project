class Post < ApplicationRecord

  belongs_to :user
  validates :title, presence: true, length: {minimum:3, maximum:50}

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
  
end
