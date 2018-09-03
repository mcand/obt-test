require 'spec_helper'

describe TaskSequence do

	context('valid tasks') do
		let(:empty_task) { Hash.new }
		let(:valid_task) { {:a => nil, :b => 'c', :c => nil}}

		it 'should sequence empty string' do
			task_sequence = described_class.new(empty_task)
			task_sequence.order
			expect(task_sequence.result).to eq('Output: ')
		end

		it 'should be possible to output simple tasks' do
			task_sequence = described_class.new(valid_task)
			task_sequence.order
			expect(task_sequence.result).to eq('Output: a c b')
		end
	end

	context('invalid tasks') do
		let(:self_dependent) { {:a => 'a', :c => 'c', :d => nil} }
		let(:cyclic) { { :a => nil, :b => 'c', :c => 'f', :d => 'a', :e => nil, :f => 'b' }}

		it 'should throw an error on self dependent tasks' do
			task_sequence = described_class.new(self_dependent)
			expect{task_sequence.order}.to raise_error(SelfDependentError, /A task cannot depend on itself./)
		end

		it 'should throw an error on cyclic tasks' do
			task_sequence = described_class.new(cyclic)
			expect{task_sequence.order}.to raise_error(CyclicError, /Cyclic error detected/)
		end
	end

end