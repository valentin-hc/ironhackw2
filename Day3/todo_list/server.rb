require "sinatra"
require "sinatra/reloader"
require "rspec"

# require_relative 'lib/todotasks.rb'
require_relative 'lib/todolist.rb'



get "/index" do
	"Welcome to the todo_list"
	todo_list = TodoList.new("Josh")
	new_task = Task.new("Finish this thing")
	todo_list.add(new_task)
	todo_list.add(Task.new("Testing things out"))
	todo_list.add(Task.new("Testing things out"))
	todo_list.save
	todo_list.load_tasks
	@tasks = todo_list.tasks
	erb(:index)
end


get "/new_task" do
	erb(:new_task)

end