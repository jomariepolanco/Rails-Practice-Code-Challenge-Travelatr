class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 
    
    validates :name, uniqueness: true 
    validates :age, numericality: {greater_than:0, less_than:25}
    validates :bio, length: {minimum: 30 }

    def total_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        self.posts.max {|post| post.likes}
    end
    
end
