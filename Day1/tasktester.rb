RSpec.describe "Task tester" do
	describe "Task" do 
		before :each do 
			@task = Task.new("cook food")
		end
		it "gives the current_id to each new task and increments it by one" do
			expect(@task.id).to eq(1)
		end
		it "returns true if a task is completed, false otherwise" do
			expect(@task.completed?).to eq(false)
		end
		it "changes completed? to true" do
			expect(@task.completed!).to eq(true)
		end
		it "chamges completed? back to false" do
			expect(@task.make_incomplete!).to eq(false)
		end
		it "sets up the time of creation of a task" do
			expect(@task.created_at).to be_within(0.00001).of(DateTime.now)
		end
		it "updates the content of a given task" do 
			expect(@task.update_content!("bob")).to eq("bob")
		end
		it "sets updated_at to the current time when update_content! is ran" do
			expect(@task.updated_at).to be_within(0.00001).of(DateTime.now)
		end
	end
end