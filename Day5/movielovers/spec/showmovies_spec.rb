RSpec.describe "Search" do 
	before(:each) do
		@model = Showmovies.new
	end
	it "takes a search term and returns an array of 9 movies that each have a poster image link" do
		query = @model.show_nine("Start Trek")
		expect(@model.result.length).to eq(9)
	end
	it "takes asks a question and returns if the answer was true or false" do 
		expect(@model.question("1987", "1987")).to eq(true)
	end	
	it "takes a number and returns a random number between 0 and the chosen number" do
		expect(@model.random(3)).to be_between(0, 9).inclusive
	end
end
		