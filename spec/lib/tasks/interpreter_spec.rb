require 'spec_helper'

describe Interpreter do
	let(:valid_commands) { ["a => \n", "b => \n", "c =>"] }
	let(:invalid_commands) { "a a"}

	it 'returns and empty array if file does not exist' do
		allow(File).to receive(:exist?).with('invalid-file.txt').and_return(false)

		interpreter = Interpreter.new('invalid-file.txt')

		expect(interpreter.read!).to eq([])
	end

	it 'reads a valid command' do
		allow(File).to receive(:exist?).with('valid-commands.txt').and_return(true)
		allow(File).to receive(:readlines).with('valid-commands.txt').and_return(valid_commands)

		valid_interpreter = Interpreter.new('valid-commands.txt')
		valid_interpreter.read!

		expect(valid_interpreter.read!).to be(true)
	end
end