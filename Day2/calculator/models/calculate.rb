class Calculate
	attr_reader :n1, :n2, :button
	def initialize(n1, n2, button)
		@button = button
		@n1 = n1
		@n2 = n2
	end
	def calculate
		result = (@n1.to_f).method(@button).(@n2.to_f)
	end
end