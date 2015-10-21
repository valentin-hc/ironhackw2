require "pry"
require "sinatra"
require "sinatra/reloader"
require "rspec"

# require_relative 'lib/todotasks.rb'
require_relative 'lib/todolist.rb'

todo_list = TodoList.new("Josh")
todo_list.add(Task.new("Testing things out"))
todo_list.add(Task.new("Beat up Sinatra"))
todo_list.save

get "/" do
	"Welcome to the todo_list"
	todo_list.load_tasks
	@tasks = todo_list.tasks
	erb(:index)
end


get "/new_task" do
	erb(:new_task)
end

post "/create_task" do
	#binding.pry
	todo_list.add(Task.new(params[:newtask]))
	todo_list.save
	redirect ("/")
end

post "/complete" do 
	number = params[:id].to_i
	find = todo_list.find_task_by_id(number)
	#binding.pry
	if find[0].completed? == false
		find[0].completed!
		todo_list.save
	else
		find[0].make_incomplete!
		todo_list.save
	end
	redirect ("/")
end

post "/delete" do 
	number = params[:id].to_i
	find = todo_list.find_task_by_id(number)
	#binding.pry
	todo_list.delete_task(find[0].id)
	todo_list.save
	redirect ("/")
end

