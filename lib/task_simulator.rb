require_relative 'tasks/command_parser'
require_relative 'tasks/interpreter'
require_relative 'tasks/client'
require_relative 'tasks/task_sequence'
require_relative 'tasks/self_dependent_error'
require_relative 'tasks/invalid_row_error'
require_relative 'tasks/cyclic_error'

Client.new(ARGV[0]).run if ARGV[0]