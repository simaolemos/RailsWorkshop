class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :Posts

  validates :email, :username, :password,
    presence: true, on: :create

  validates :email, :password,
    presence: true, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
