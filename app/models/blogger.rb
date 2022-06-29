class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
        posts.max_by {|p| p.likes}
    end

    def total_likes
        posts.map {|p| p.likes}.reduce(:+)
    end

    def most_written
        destinations.sort_by {|d| d.posts.count} .reverse.first(5)
    end
end
