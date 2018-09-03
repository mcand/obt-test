require 'spec_helper'

describe Client do
	let(:tasks) { ["a => \n", "b => \n", "c =>"]}

	it 'should start client and run commands' do
		allow(File).to receive(:exist?).with('tasks.txt').and_return(true)
		allow(File).to receive(:readlines).with('tasks.txt').and_return(tasks)

		client = Client.new('tasks.txt')
		expect { client.run }.to output("Output: a b c\n").to_stdout
	end 
end