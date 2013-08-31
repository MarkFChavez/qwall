class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { maximum: 12 }
  # attr_accessible :title, :body

  has_many :posts, dependent: :destroy
  has_many :user_favorites
  has_many :favorites, through: :user_favorites, source: :post
end
