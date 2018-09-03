class CyclicError < StandardError
	def initialize(msg="Cyclic error detected")
		super
	end
end