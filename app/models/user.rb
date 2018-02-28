class User < ApplicationRecord
  has_many :Posts

  validates :email, :username, :password,
    presence: true, on: :create

  validates :email, :password,
    presence: true, on: :update

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
