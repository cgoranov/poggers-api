class Game < ApplicationRecord
    has_many :gamegenres
    has_many :genres, through: :gamegenres
    

    def genre_attributes=(genres_attributes)
        genres_attributes.each do |g|
            genre = Genre.find_or_create_by(name: g["name"])
            self.genres << genre
        end
    end

end
