class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  has_many :posts, dependent: :destroy
  
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 30 }, allow_nil: true
  validates :introduction, length: { maximum: 150 }
end
