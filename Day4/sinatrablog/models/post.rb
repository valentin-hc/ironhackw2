class Post
	@@id_number = 1
	attr_reader :title, :date, :text, :id, :author
	attr_accessor :sponsored, :date, :id_number
	attr_accessor :category
	def initialize(title, text, category, author = "anonymous")
		@title = title
		@date = DateTime.now
		@text = text
		@category = category
		@id = @@id_number
		@@id_number +=1
		@sponsored = false
		@author = author
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
	def status
		case sponsored?
		when true
			"sponsored"
		else
			"normal"
		end
	end
end