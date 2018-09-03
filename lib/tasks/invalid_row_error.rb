class InvalidRowError < StandardError
	def initialize(msg="Row not valid")
		super
	end
end