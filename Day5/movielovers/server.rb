require "sinatra"
require "sinatra/reloader"
require "pry"
require "date"
require "IMDB"

require_relative "models/showmovies.rb"

#require_relative "spec/showmovies_spec.rb"


require_relative "controller/controller.rb"


# i = Imdb::Movie.new("0095016")

# puts i.title
# #=> "Die Hard"

# puts i.cast_members.first

# #puts i.size
# #=> "Bruce Willis"


# search = Imdb::Search.new("Star Trek")
# #binding.pry

# search.movies.size
# binding.pry
# puts search
