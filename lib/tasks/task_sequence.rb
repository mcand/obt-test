class TaskSequence
	attr_reader :tasks, :result

	def initialize(tasks)
		@tasks = tasks
		@result = []
	end

	def order
		tasks.each do |k, v| 
			raise SelfDependentError if has_self_dependency?(k,v)
			insert_job_to_result(k.to_s, v)
		end
		@result.join('')
	end

	def result
		"Output: #{@result.compact.join(" ")}"
	end

	private

	def insert_job_to_result(k,v)
		raise CyclicError if has_cyclic_dependencies?(k,v)
		return @result.insert(set_position(v,true), k) if include_one_of?(k,v)
		return @result.insert(set_position(k,false), v) if include_one_of?(v,k)
		@result.push(v) if !v.nil?
		@result.push(k)
	end

	def include_one_of?(k,v)
		!result_include?(k) && result_include?(v)
	end

	def result_include?(task)
		@result.include?(task)
	end

	def set_position(v,after)
		return @result.index(v) + 1 if after
		@result.index(v)
	end

	def has_self_dependency?(k,v)
		k.to_s == v
	end

	def has_cyclic_dependencies?(k,v)
 		result_include?(k) && @result.include?(v) && @result.index(k) < @result.index(v)
	end

end