class Interpreter
	attr_reader :commands

	def initialize(path)
		@path = path
	end

	def read!
		return [] unless File.exist?(@path)

		lines = File.readlines(@path)
		command_parser = CommandParser.new
		command_parser.load(lines)
		task_sequence = TaskSequence.new(command_parser.tasks)
		task_sequence.order
		puts "#{task_sequence.result}"
		true
	end
end