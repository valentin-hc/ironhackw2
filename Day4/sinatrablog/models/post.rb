class Post
	@@id_number = 1
	attr_reader :title, :date, :text, :id
	attr_accessor :sponsored, :date, :id_number
	def initialize(title, text)
		@title = title
		@date = DateTime.now
		@text = text
		@id = @@id_number
		@@id_number +=1
		@sponsored = false
	end
	def sponsored?
		@sponsored
	end
	def sponsore!
		@sponsored = true
	end
	def unsponsore!
		@sponsored = false
	end
end