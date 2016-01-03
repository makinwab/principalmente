require 'colorize'
require_relative 'response'
require_relative 'principalmente'

class Runner
	attr_reader :msg_status, :level, :level_entry

	def run
		game_entry = STDIN.gets.chomp.downcase
		parse_game_entry game_entry
	end

	def pre_play
		Response.new :pre_play
		print "> "

		@level_entry = STDIN.gets.chomp.downcase
		parse_game_level_entry

		play
	end

	def play
		Response.new @msg_status

		principalmente = Principalmente::Mastermind.new(@level_entry.to_sym, @level)
		game_state = nil
		
		until game_state && game_state == :quit
			print "> "
			input = STDIN.gets.chomp.downcase
			game_state = principalmente.execute(input)

			break if game_state == :quit
			Response.new game_state

			if game_state == :won
				run
				break
			end
		end

		quit
	end

	def quit
		Response.new :quit
		exit
	end

	private

	def parse_game_entry(entry)
		case entry
		when 'j', 'jugar'
			pre_play
		when 'i', 'instrucciones'
			Response.new :start
			run
		when 'd', 'dejar'
			quit
		else
			puts 'Entra en la consola "j"jugar, "i"instrucciones, "d"dejar'.red
			run
		end
	end

	def parse_game_level_entry
		case @level_entry
		when 'p'
			@level = 4
			@msg_status = :b_play
		when 'i'
			@level = 5
			@msg_status = :i_play
		when 'a'
			@level = 6
			@msg_status = :a_play
		else
			puts 'El nivel no existe'.red
			run
		end
	end
end
