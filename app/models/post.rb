class Post < ApplicationRecord
    belongs_to :user
    
    attachment :image
    
    validates :image, presence: true
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 500 }
    validates :user_id, presence: true
end
