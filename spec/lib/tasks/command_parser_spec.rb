require 'spec_helper'

describe CommandParser do
	describe('#parse') do
			let(:command_two_task_line) { 'a => b' }
			let(:command_one_side_line) { 'd => ' }
			let(:command_two_task_no_space) { 'a=>b' }
			let(:invalid_line) { 'a -> b' }
			let(:empty) { ' ' }

			it('should parse an empty line') do
				command_parser = described_class.new
				command_parser.parse(empty)
				expect(command_parser.tasks).to eq({ })
			end

			it('should parse a simple task line') do
				command_parser = described_class.new
				command_parser.parse(command_one_side_line)
				expect(command_parser.tasks).to eq({d: nil})
			end

			it('should parse a double task line') do
				command_parser = described_class.new
				command_parser.parse(command_two_task_line)
				expect(command_parser.tasks).to eq({a: 'b'})
			end

			it('should parse a double task line with no space') do
				command_parser = described_class.new
				command_parser.parse(command_two_task_no_space)
				expect(command_parser.tasks).to eq({a: 'b'})
			end

			it('should ignore invalid task line') do
				command_parser = described_class.new
				expect{command_parser.parse(invalid_line)}.to raise_error(InvalidRowError, /Row not valid/)			
			end
	end
	
end