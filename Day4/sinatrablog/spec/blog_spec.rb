RSpec.describe "Blog" do 
	before(:each) do
		@blog = Blog.new
		@post = Post.new("Test", "super text")
		@post2 = Post.new("Second post", "second cool text")
	end
	it "creates an empty array to store posts" do
		expect(@blog.container).to eq([])
	end
	it "adds a post to the array of posts" do
		@blog.add_post(@post)
		expect(@blog.container[-1]).to eq(@post)
	end
	it "sorts posts by date from newst to oldest" do
		@blog.add_post(@post)
		@post2.date = DateTime.now + 70000
		@blog.add_post(@post2)
		@blog.sort_posts_new_first
		#binding.pry
		expect(@blog.container[-1]).to eq(@post)
	end
	it "sorts posts by date from oldest to newst" do
		@post2.date = DateTime.now + 70000
		@blog.add_post(@post2)
		@blog.add_post(@post)
		@blog.sort_posts_old_first
		#binding.pry
		expect(@blog.container[-1]).to eq(@post2)
	end
	it "adds a new post to the array of posts" do
		@blog.create_new("bob", "bobtext")
		expect(@blog.container[-1].text).to eq("bobtext")
	end
	it "finds a post by its id when given a number" do
		@blog.add_post(@post2)
		@blog.add_post(@post)
		#binding.pry
		expect(@blog.find_post_by_id(18)).to eq(@post)
	end
	it "removes a post from the array by its id key" do
		@blog.add_post(@post)
		@blog.delete_post(20)
		expect(@blog.container.size).to eq(0)
	end

end
		