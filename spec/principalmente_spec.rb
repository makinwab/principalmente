require 'spec_helper'

describe Principalmente::Mastermind do

  let(:color_map) {
    {
      :p => ['a', 'r', 'v', 'm'],
      :i => ['a', 'r', 'v', 'm', 'n', 'c'],
      :a => ['a','r','v','m','n','c','g','p']
    }
  }

	context "version number" do
		it 'tiene un numero version' do
    	expect(Principalmente::VERSION).not_to be nil
  	end
	end
end
