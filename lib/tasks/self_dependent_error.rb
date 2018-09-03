class SelfDependentError < StandardError
	def initialize(msg="A task cannot depend on itself.")
		super
	end
end