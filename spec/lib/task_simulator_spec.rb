require 'spec_helper'

describe 'TaskSimulator' do
		let(:tasks) { ["a => \n", "b => \n", "c =>"] }

		it 'runs the job simulator with commands from a file' do
			allow(File).to receive(:exist?).with('tasks.txt').and_return(true)
			allow(File).to receive(:readlines).with('tasks.txt').and_return(tasks)

			expect { Client.new('tasks.txt').run }.to output("Output: a b c\n").to_stdout
		end
end