require_relative 'response'
require_relative 'runner'

module Principalmente
	class Game
		attr_reader :modes, :difficulty_level, :color_map, :status

		def initialize
			@runner = Runner.new
		end

		def start
			Response.new(:start)
			@runner.run
		end

	end
end