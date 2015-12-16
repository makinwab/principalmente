require_relative 'response'
require_relative 'version'

module Principalmente
  class Mastermind
  	def execute(input)
  		secret = "BBGR"
  		if input == secret
  			Response.new(:message => "Usted gana!", :status => :won)
  		else
  			Response.new(:message => "Supongo que otra vez!", :status => :continue)
  		end
  	end
  end
end
