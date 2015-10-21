require_relative "todotasks.rb"
require "pry"
require "YAML/store"
#require_relative ("../spec/listtester.rb")

module Storage
	def save
        @todo_store = YAML::Store.new("./public/tasks.yml")
		@todo_store.transaction do 
			@todo_store[@user] = @tasks
		end
    end
    def load_tasks
        @todo_load = YAML::load( File.open( "./public/tasks.yml"))
    	@tasks = @todo_load[@user]
    end
end


class TodoList
    include Storage
    attr_accessor :tasks
    def initialize(user)
    	@todo_store = YAML::Store.new("./public/tasks.yml")
    	@user = user
        @tasks = []
    end
    def add(task)
    	@tasks << task
    end
    def delete_task(number)
    	@tasks.delete_if { |h| h.id == number }
    end
    def find_task_by_id(given_id)
    	@tasks.select { |x| x.id == given_id}
    end
    def sort_by_created(order)
    	if order == "ASC"
	    	@tasks.sort do |a, b| 
	    		a.created_at <=> b.created_at 
	    		#binding.pry
	    	end
	    elsif order == "DESC"
	    	@tasks.sort do |a, b| 
	    		b.created_at <=> a.created_at
	    	end
	    end 		
    end
end


