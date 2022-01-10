class Game < ApplicationRecord
    has_many :comments

    def genre_attributes=(comments_attributes)
        comments_attributes.each do |g|
            comment = Comment.find_or_create_by(content: g["name"])
            self.comments << comment
        end
    end

end
