class CommandParser
	attr_reader :tasks


	def initialize
		@tasks = {}
	end

	def parse(cmd)
		if cmd.length > 1
			row = cmd.scan(/(\w)\s*=>\s*(\w|)/).flatten
			raise InvalidRowError if row.empty?
			@tasks[row.first.to_sym] = row.last.empty? ? nil : row.last
		end
	end

	def load(lines)
		lines.map do |line|
			parse(line)
		end.compact
	end
end