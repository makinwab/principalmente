require_relative 'message_helper'

class Response
	attr_reader :status

	def initialize(status)
		@status = status

		respond
	end

	def respond
		case @status
		when :start, :won
			Principalmente::MessageHelper.new.start_message
		when :pre_play
			Principalmente::MessageHelper.new.pre_play_message
		when :b_play
			Principalmente::MessageHelper.new.beginner_play_message
		when :i_play
			Principalmente::MessageHelper.new.intermediate_play_message
		when :a_play
			Principalmente::MessageHelper.new.advanced_play_message
		when :quit
			Principalmente::MessageHelper.new.exit_message
		else
			
		end
	end
end