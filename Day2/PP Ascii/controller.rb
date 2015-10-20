require "sinatra"
require "sinatra/reloader"
require "artii"

get "/" do
	
end


# get "/ascii/:word" do
# 	text = Artii::Base.new
# 	@test = text.asciify(params[:word])
# 	erb(:ascii)
# end	

get "/ascii/:word/?:font?" do
	text = ""
	if params[:font] == nil
		text = Artii::Base.new
	else
		text = Artii::Base.new :font => params[:font]
	end
	@test = text.asciify(params[:word])
	erb(:ascii)
end	