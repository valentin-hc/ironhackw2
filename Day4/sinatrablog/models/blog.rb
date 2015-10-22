class Blog
	attr_accessor :container
	def initialize
		@container = []
	end
	def add_post(post)
		@container << post
	end
	def sort_posts_new_first
		sorted = @container.sort do |a, b|
			b.date <=> a.date
		end
		sorted
		@container = sorted
	end
	def sort_posts_old_first
		sorted = @container.sort do |a, b|
			a.date <=> b.date
		end
		sorted
		@container = sorted
	end
	def create_new(title, text, category)
		add_post(Post.new(title, text, category))
	end
	def find_post_by_id(number)
		@container.find do |post|
			post.id == number
		end
	end
	def delete_post(number)
		@container.delete_if { |h| h.id == number }
	end
end