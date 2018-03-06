class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :posts

  has_many :followers

  has_many :followed,
    class_name: 'Follower',
    foreign_key: 'followed_id'

  has_many :following,
    class_name: 'Follower',
    foreign_key: 'following_id'

  # has_many :following,
  #   through: :follower,
  #   class_name: 'User',
  #   foreign_key: 'following_id'

  # has_many :followers

  # has_many :followed,
  #   through: :follower,
  #   source :followed
    # class_name: 'Follower',
    # foreign_key: 'followed_id'


    # through: :followers,
    # source: :followed
    # through: :follower

  #
  # has_many :follower,
  # through: :follower,
  # source: :users

  validates :username,
    presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def timeline_posts
     Post.where(user_id: followed_ids + [id])
   end
end
