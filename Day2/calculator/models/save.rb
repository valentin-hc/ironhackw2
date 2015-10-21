require "pry"
require "YAML/store"

module Storage
	def save
        @todo_store = YAML::Store.new("./public/result.yml")
		@todo_store.transaction do #.transaction just stops the state of the database to as it s now while the operation is gonna be done.
			@todo_store[@operation] = @result #then I create an object
		end
    end
    def load_tasks
        @todo_load = YAML::load( File.open( "./public/result.yml"))
    	@result = @todo_load[@operation]
    end
end

class Saving

    def initialize(result, operation)
        @result = result
        @operation = operation
    end
end


