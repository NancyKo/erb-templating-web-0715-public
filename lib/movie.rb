class Movie 
	attr_accessor :title, :release_date, :director, :summary
@@movies = []
	def initialize(title, release_date, director, summary)
		@title = title
		@release_date = release_date
		@director = director
		@summary = summary
		@@movies << self 
	end

	def url
		"#{@title.downcase.gsub(" ", "_")}.html"
	end

	def self.all
		@@movies
	end

	def self.reset_movies!
		@@movies.clear
	end

	def self.make_movies!
		f = File.read('./spec/fixtures/movies.txt').split("\n")
		f.each do |line| 
			attribute = line.split(" - ") 
			Movie.new(attribute[0], attribute[1].to_i, attribute[2], attribute[3])
		end
	end

	def self.recent
		# movies title on or after 2012
		@@movies.select { |movie| movie if movie.release_date >= 2012 }
	end
		
end


