class Movie 
	attr_accessor :title, :release_date, :director, :summary
	def initialize(title, release_date, director, summary)
		@title = title
		@release_date = release_date
		@director = director
		@summary = summary
	end

	def url
		"#{@title.downcase.gsub(" ", "_")}.html"
	end

	def self.all
		
	end
end