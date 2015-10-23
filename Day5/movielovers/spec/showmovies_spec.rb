RSpec.describe "Search" do 
	before(:each) do
		@model = Showmovies.new
	end
	it "takes a search term and returns an array of 9 movies that each have a poster image link" do
		query = @model.show_nine("Start Trek")
		expect(@model.result.length).to eq(9)
	end
	it "takes asks a question and returns if the answer was true or false" do 
		expect(@model.year_question("1987", "1987")).to eq(true)
	end	
end
		