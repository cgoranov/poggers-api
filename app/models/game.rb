class Game < ApplicationRecord
    has_many :genres

    def genre_attributes=(genres_attributes)
        genres_attributes.each do |g|
            genre = Genre.find_or_create_by(name: g["name"])
            self.genres << genre
        end
    end

end
