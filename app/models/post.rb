class Post < ApplicationRecord
    belongs_to :user
    
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    
    attachment :image
    
    validates :image, presence: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :body, presence: true, length: { maximum: 500 }
    validates :user_id, presence: true
end
