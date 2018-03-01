class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :posts

  has_many :follower

  has_many :following,
    through: :follower,
    class_name: 'Follower',
    foreign_key: 'following_id'

  has_many :followed,
    through: :follower,
    class_name: 'Follower',
    foreign_key: 'followed_id'

  #
  # has_many :follower,
  # through: :follower,
  # source: :users

  validates :username,
    presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
