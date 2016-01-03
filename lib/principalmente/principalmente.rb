require_relative 'response'
require_relative 'message_helper'
require_relative 'version'

module Principalmente
  class Mastermind

  	COLOR_MAP = 
    {
      :p => ['a', 'r', 'v', 'm'],
      :i => ['a', 'r', 'v', 'm', 'n', 'c'],
      :a => ['a','r','v','m','n','c','g','p']
    }

  	attr_reader :number_of_guesses, :status, :random_color_code

  	def initialize(level_entry, level)
  		@number_of_guesses = 0
  		@start_time = Time.now
      @difficulty_level = level

      @random_color_code = generate_color_code level_entry, level
      
  	end

    def generate_color_code(level_entry, level)
      Array.new(level) { COLOR_MAP[level_entry].sample }.join('')
    end

  	def execute(input)
  		valid_input = validate_input(input)

  		if valid_input == 0
  			continue_game_play input
  		end

  		@status
  	end

  	def continue_game_play(input)
  		number_of_correct_elements = 0
  		right_position = 0
      @number_of_guesses += 1

  		if input == @random_color_code
        game_time = parse_time

        Principalmente::MessageHelper.new.win_message input, @number_of_guesses, game_time[:min], game_time[:sec]
  			@status = :won
  		else
  			color_code = @random_color_code.split("")
  			input.split("").each_with_index do |letter, index| 
	  				right_position += 1 if letter == @random_color_code.split("")[index]

	  				if color_code.include? letter
	  					number_of_correct_elements += 1
	  					color_code.delete letter
	  				end
	  		end

        Principalmente::MessageHelper.new.game_message input, number_of_correct_elements, right_position, @number_of_guesses

	  		@status = :continue
  		end
  	end

    private

    def parse_time
      t = (Time.now - @start_time)
      min, sec = t.divmod(60)
      hh, min = min.divmod(60)

      { min: min.floor, sec: sec.floor, hh: hh.floor }
    end

  	def validate_input(input)
  		result = input.length <=> @difficulty_level
      
  		if result == 0
  			result = 0
  		elsif result == -1

  			if input.downcase == 'd'
  				@status = :quit
  			elsif input.downcase == 'c'
  				Principalmente::MessageHelper.new.cheat_message @random_color_code
  				@status = :continue
  			else
  				Principalmente::MessageHelper.new.short_code_message
  				@status = :continue
  			end
 
  		elsif result == 1

  			if input.downcase == 'dejar'
  				@status = :quit
  			elsif input.downcase == 'cheat'
  				Principalmente::MessageHelper.new.cheat_message @random_color_code
  				@status = :continue
  			else
  				Principalmente::MessageHelper.new.long_code_message
  				@status = :continue
  			end

  		end

  		result
  	end
  end
end
