require 'pry'

class Song

	@@count = 0
	@@artists = []
	@@genres = []

	attr_accessor :name, :artist, :genre

	def initialize(name, artist, genre)
		@name, @artist, @genre = name, artist, genre
		@@count += 1
		@@artists << artist
		@@genres << genre
	end

	#Getter methods for class vars
	def self.count
		@@count
	end

	def self.artists
		@@artists.uniq!
	end

	def self.genres
		@@genres.uniq!
	end

	#Returns genre histogram {"rap" => 5, ...}
	def self.genre_count
		Hash[*@@genres.group_by{|v| v}.flat_map{|k, v| [k, v.size] }]
	end

	def self.artist_count
		Hash[*@@artists.group_by{|v| v}.flat_map{|k, v| [k, v.size] }]	
	end

end


s1 = Song.new("Lucifer", "Jay-Z", "rap")
s2 = Song.new("99 Problems", "Jay-Z", "rap")
s3 = Song.new("hit me baby one more time", "Brittany Spears", "pop")


# binding.pry

# puts "Arbitrary"