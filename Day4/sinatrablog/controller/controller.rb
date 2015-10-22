
blog = Blog.new
blog.add_post(Post.new("Amazing post 1", "Amazing text for the post 1", "general", "Bob"))
blog.add_post(Post.new("Amazing post 2", "Amazing text for post2", "awesome"))

get "/" do 
	#binding.pry
	@blog = blog
	#@blog.sort_posts_new_first
	@posts = @blog.container
	erb(:index)
end


post "/new_post" do 
	#binding.pry
	blog.add_post(Post.new(params[:title], params[:text], params[:category], params[:author]))
	redirect "/"
end

get "/post_detail/:id" do
	@detail = blog.find_post_by_id((params[:id]).to_i)
	#binding.pry
	erb(:post_detail)
end

post "/sponsore" do
	post = blog.find_post_by_id((params[:id]).to_i)
	if post.sponsored?
		post.unsponsore!
	else
		post.sponsore!
	end
	#binding.pry
	redirect "/"
end

post "/order_by" do 
	if params[:order] == "old"
		blog.sort_posts_old_first
	else
		blog.sort_posts_new_first
	end
	redirect "/"
end
