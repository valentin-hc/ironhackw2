#test functionality, never data !!

RSpec.describe "Post" do 
	before(:each) do
		@post = Post.new("Test Post", "This is a super post", "general", "jo")
		@post2 = Post.new("second Post", "some text", "awesome", "bob")
	end
	it "creates a post with a given id, title, and content and sets its date to current_date" do
		expect(@post.title).to eq("Test Post")
		expect(@post.text).to eq("This is a super post")
		expect(@post.date).to be_within(0.0001).of DateTime.now
		expect(@post2.id).to eq(2)
		expect(@post2.author).to eq("bob")
	end
	it "changes a post status to sponsored" do 
		@post.sponsore!
		expect(@post.sponsored?).to eq(true)
	end
	it "changes a post status back to normal" do
		@post.sponsore!
		@post.unsponsore!
		expect(@post.sponsored?).to be_falsey
	end
	it "shows sponsored if sponsored? is true, normal otherwise" do
		@post.sponsore!
		expect(@post.status).to eq("sponsored")
	end
	it "shows category of the post after creation" do
		expect(@post2.category).to eq("awesome")
	end
end
