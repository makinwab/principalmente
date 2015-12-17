require 'spec_helper'

describe Principalmente::Mastermind do

	let(:exec_game) { Principalmente::Mastermind.new }

	context "version number" do
		it 'tiene un numero version' do
    	expect(Principalmente::VERSION).not_to be nil
  	end
	end

  context "#execute" do

  	it 'returns won when the right guess is made' do
  		result = exec_game.execute("BBGR")

  		expect(result.status).to eql :won
  	end

  	it 'returns continue when a wrong guess is made' do
  		result = exec_game.execute("BBRG")

  		expect(result.status).not_to eql :won
  	end
  end

end
