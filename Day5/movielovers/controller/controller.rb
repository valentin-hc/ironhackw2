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
	prng = Random.new
	random = prng.rand(9)
	model.show_nine(params[:query].tr("_", " "))
	@movie_list = model.result
	@year = model.result[random].year
	#binding.pry
	erb(:result)
end

post "/answer" do 
	result = model.year_question(params[:answer], params[:user_answer])
	if result 
		@answer = "right"
	else
		@answer = "wrong"
	end
	redirect "/result_quizz/#{@answer}"
	#binding.pry
end

get "/result_quizz/:answer" do 
	@answer = params[:answer]
end


