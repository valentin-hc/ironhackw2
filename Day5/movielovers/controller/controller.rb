get "/" do 
	erb(:index)
end

model = Showmovies.new

post "/search_result" do
	model = Showmovies.new
	query = params[:search_result].tr(" ", "_")
	redirect "/result/#{query}"
end

get "/result/:query" do
	random_answer = model.random(9)
	random_question = model.random(3)
	model.show_nine(params[:query].tr("_", " "))
	movie_list = model.result
	answer = movie_list[random_answer]
	case random_question
	when 0
		@question = "Which of these movies was released in #{answer.year}?"
	when 1
		@question = "Which of these movies was directed by #{answer.director[0]}?"
	when 2 
		@question = "In which of these movies did #{answer.cast_members.first} played?"
	else
		@question = "Which of these is the best movie (in MY opinion)?"
	end
	@id = answer.id
	@movie_list = ""
	movie_list.each do |movie| 
		@movie_list += "<div class='col-lg-4 col-md-4 col-sm-6 col-xs-12 thumb'>
			<a href='/answer/#{movie.id}/#{@id}'>
				<img class='img-responsive' src='#{movie.poster}'>
			</a>
		</div>"
	end
	#binding.pry
	erb(:result)
end

get "/answer/:id_choice/:id_answer" do
	redirect "result_quizz/#{params[:id_choice]}/#{params[:id_answer]}"
end


get "/result_quizz/:id_choice/:id_answer" do 
	if model.question(params[:id_answer], params[:id_choice]) 
		@answer = "You got it right !"
	else
		@answer = "Wrong answer, maybe next time !"
	end
end


