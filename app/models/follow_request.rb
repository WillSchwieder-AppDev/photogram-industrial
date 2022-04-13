class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

  validates :user_id, uniqueness: { scope: :photo_id, message: "has already liked this photo" }
end
