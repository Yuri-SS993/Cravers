class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 30 }, allow_nil: true
  validates :introduction, length: { maximum: 150 }
  
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
