class Checker
	def initialize
		@logins = [
			{
				username: "bob",
				password: "bobby"
			},
			{
				username: "jo",
				password: "mypassword"
			}
		]
	end
	def add_users(username, password)
		@logins << {:username => username, :password => password}
	end
	def login(username, password)
		@logins.find do |pair|
			username == pair[:username] && password == pair[:password]
		end
	end
end

