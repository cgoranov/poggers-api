class Game < ApplicationRecord
    has_many :comments
    validates :name, presence: true
    validates :name, uniqueness: true

    def comment_attributes=(comments_attributes)
        comments_attributes.each do |g|
            comment = Comment.create(content: g["content"])
            self.comments << comment
        end
    end

end
