require_relative 'response'
require_relative 'version'

module Principalmente
  class Mastermind
  	COLOR_CODE = ['B', 'R', 'G', 'Y']

  	attr_reader :level

  	def initialize
  		@level = 4
  		@random_color_pattern = Array.new(@level) { COLOR_CODE.sample }.join('').upcase
  		puts @random_color_pattern
  	end

  	def execute(input)
  		if input == @random_color_pattern
  			Response.new(:message => "Usted gana!", :status => :won)
  		else
  			Response.new(:message => "Supongo que otra vez!", :status => :continue)
  		end
  	end
  end
end
