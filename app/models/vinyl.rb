class Vinyl < ActiveRecord::Base
    validates :album_name, :artist_name, :vinyl_condition, presence: true
    belongs_to :user
end