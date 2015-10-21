require "rspec"

class PasswordChecker
	def check_password(username, password)
		res = []
		res << check_length(password)
		res << check_number(password)
		res << check_symbol(password)
		if res << check_username(username) == true
			res << check_email_diff(username, password)
		end
		res << check_letters(password)
		res << check_letters(password, true)
		res.select {|element| element != true}
	end
	def check_length(password)
		case password.length > 7
		when false
			"Password too short"
		else
			true
		end
	end
	def check_number(password)
		case password =~ /\d/
		when nil
			"Password should contain at least one number"
		else
			true
		end
	end
	def check_symbol(password)
		case password =~ /\W/
		when nil
			"Password should contain at least one symbol"
		else
			true
		end	
	end
	def check_email_diff(username, password)
		case username.slice(0...username.rindex(/\./)).split("@").map { |name| password.include? name }.include? true
		when true
			"Password cannot contain email elements"
		else
			true
		end
	end
	def check_username(username)
		case username.include?("@") && username.include?(".")
		when false
			"Not a valid email"
		else
			true
		end
	end
	def check_letters(password, uppercase = false)
		case uppercase
		when true
			tmp = password =~ /\p{Upper}/
			#p tmp
		when false
			tmp = password =~ /\p{Lower}/
			#p tmp
		end

		case tmp
		when nil
			"Password should have at least one uppercase and one lowercase"
		else
			true
		end
	end
end


RSpec.describe "Password Checker" do
	let(:checker) {PasswordChecker.new}
	entry = {username: "john@mail.com", password: "xxAxx/xx3xxxxjohn"}
	it "checks if password length is more than 7" do
		expect(checker.check_length(entry[:password])).to be true
	end
	it "at least one lowercase letter and one uppercase" do
		expect(checker.check_letters(entry[:password])).to be true
		expect(checker.check_letters(entry[:password], true)).to be true
	end
	it "at least one number" do
		expect(checker.check_number(entry[:password])).to be true
	end
	it "at least one symbol" do
		expect(checker.check_symbol(entry[:password])).to be true
	end
	it "cant ressemble email" do
		expect(checker.check_email_diff(entry[:username], entry[:password])).to be true
	end
	it "checks if array is empty after all checks ran" do
		expect(checker.check_password(entry[:username], entry[:password]).size).to eq(0)
	end
end