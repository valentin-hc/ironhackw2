require "pry"

class Eater
	def initialize(letter = "t")
		@letter = letter
	end
	def eat(string, letter)
		string.gsub!(letter.downcase, "")
		string.gsub!(letter.upcase, "")
		string
	end
end
class Lexiconomitron
	def initialize(eater: Eater.new)
		@eater = eater
	end
	def eat_t(string)
		@eater.eat(string, "t")
	end
	def shazam(array)
		array.each do |x|
			@eater.eat(x, "t")
			x.reverse!
		end
	end
	def oompa(array)
		array.select { |x| @eater.eat(x, "t").length <= 3}
	end
end
RSpec.describe "Lexiconomitron" do
	describe Lexiconomitron do 
	  describe "#eat_t" do
	  	let (:lexi) {Lexiconomitron.new}
	    	it "removes every letter t from the input" do
	    	  expect(lexi.eat_t("great scott!")).to eq("grea sco!")
	    	end
	    	it "reverses the letters order of strings within an erray" do
	    		expect(lexi.shazam(["test", "to"])).to match_array(["se", "o"])
	    	end
	    	it "filters three or less letters words and shows them in an array" do 
	    		expect(lexi.oompa(["if", "you", "want", "to", "be", "my", "lover"])).to match_array(["if", "you", "wan", "o", "be", "my"])
	    	end
	  	end
	end
end

