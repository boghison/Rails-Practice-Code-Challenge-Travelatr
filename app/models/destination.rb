class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        posts.sort_by(&:created_at).reverse.first(5)
    end

    def featured_post
        posts.max_by {|p| p.likes}
    end

    def average_blogger_age
        ages = bloggers.uniq.map {|bl| bl.age}
        ages.reduce(:+)/ages.size.to_f
    end
end
