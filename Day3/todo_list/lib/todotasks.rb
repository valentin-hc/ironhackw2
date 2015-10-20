require "pry"
#require "../spec/tasktester.rb"

class Task
    attr_reader :id, :created_at
    attr_accessor :completed, :content, :updated_at
    @@current_id = 1
    @@current_time = DateTime.now
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = @@current_time
        @updated_at = nil
    end
    def completed?
    	@completed
    end
    def completed!
    	@completed = true
    end
    def make_incomplete!
    	@completed = false
    end
    def update_content!(content)
    	@content = content
    end
    def updated_at
    	@updated_at = DateTime.now
    end
end