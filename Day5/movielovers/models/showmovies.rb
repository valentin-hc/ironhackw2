class Showmovies
	attr_reader :result
	def initialize
		@result = []
	end
	def show_nine(query)
		search = Imdb::Search.new(query)
		i = 0
		while @result.length < 9
			if search.movies[i].poster != nil
				@result << search.movies[i]
			end
			i += 1
		end
		#binding.pry
	end
	def year_question(answer, user_answer)
		user_answer == answer
	end
end

