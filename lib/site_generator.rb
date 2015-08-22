class SiteGenerator

  def make_index!
    index = <<-HEREDOC
    <!DOCTYPE html>
    <html>
      <head>
        <title>Movies</title>
      </head>
      <body>
        <ul>
        #{ dynamic_url }
        </ul>
      </body>
    </html> 
    HEREDOC
    File.open('./_site/index.html', 'w+') do 
      |file| file.write(index) 
      file.close
    end
  end

  def dynamic_url
    Movie.all.map {|movie|
    "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>" }.join("") 
  end  

  def generate_pages!
    template = File.read("lib/templates/movie.html.erb")
    erb = ERB.new(template)
    Movie.all.map do |movie|
      File.open("_site/movies/#{movie.url}", 'w+') { |file| file.write(erb.result(binding)) }
    end
  end
end