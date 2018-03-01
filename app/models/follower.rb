class Follower < ApplicationRecord
  # belongs_to :user
  belongs_to :following, foreign_key: 'following_id'
  belongs_to :followed, foreign_key: 'followed_id'
end
