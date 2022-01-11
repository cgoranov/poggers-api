class Game < ApplicationRecord
    has_many :comments

    def comment_attributes=(comments_attributes)
        comments_attributes.each do |g|
            comment = Comment.create(content: g["content"])
            self.comments << comment
        end
    end

end
