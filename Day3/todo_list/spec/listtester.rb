RSpec.describe "List tester" do
	describe "TodoList" do 
		before :each do 
			@list = TodoList.new("Josh")
			@task1 = Task.new("Walk the dog")
			@task2 = Task.new("Buy Food")
		end
		it "takes a parameter of a task, and adds it to our list of tasks" do
			@list.add(@task1)
			@list.add(@task2)
			expect(@list.tasks).to include(@task1)
		end
		it "finds a task in the task list by its ID and deletes it from the list" do
			@list.add(@task1)
			@list.add(@task2)
			current_length = @list.tasks.size
			@list.delete_task(10)
			expect(current_length).not_to eql(@list.tasks.size)  
		end
		it "finds a task by its id and returns it" do 
			@list.add(@task1)
			@list.add(@task2)
			expect(@list.find_task_by_id(13)).to match_array(@task2)
		end
		it "takes an array of tasks and sorts them by creation date" do
			task1 = Task.new("Finish this freakin exercise")
			task2 = Task.new("Buy Bread")
			task2.instance_variable_set(:@created_at, DateTime.now + 70000)
			@list.add(task1)
			@list.add(task2)
			array = @list.sort_by_created("ASC")
			expect(array.first.created_at).to be < array.last.created_at
		end
		it "loads an array of tasks previously saved for a specific user" do
			todo_list = TodoList.new("Josh")
			todo_list.add(Task.new("Walk the dog"))
			todo_list.add(Task.new("Buy the milk"))
			todo_list.add(Task.new("Make my todo list into a web app"))
			todo_list.save
			todo_list = TodoList.new("Josh")
			todo_list.load_tasks
			expect(todo_list.tasks.length).to eq(3)
		end
	end
end