class Game < ApplicationRecord
    has_many :comments
    validates :name, presence: true
    validates :name, uniqueness: true
    before_save :downcase_name

    def comment_attributes=(comments_attributes)
        comments_attributes.each do |g|
            comment = Comment.create(content: g["content"])
            self.comments << comment
        end
    end

    private

    def downcase_name
        self.name = self.name.downcase
    end

end
