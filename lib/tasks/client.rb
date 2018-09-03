 class Client
	def initialize(path)
		@path = path
	end

	def run
		interpreter = Interpreter.new(@path)

		interpreter.read!

	end
end