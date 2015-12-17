require_relative 'response'
require_relative 'version'

module Principalmente
  class Mastermind
  	COLOR_CODE = ['R', 'V', 'A', 'M']

  	attr_reader :difficulty_level, :number_of_guesses, :message, :status

  	def initialize
  		@difficulty_level = 4
  		@number_of_guesses = 0
  		@random_color_code = Array.new(@difficulty_level) { COLOR_CODE.sample }.join('').upcase
  		@start_time = Time.now

  		puts @random_color_code
  	end

  	def execute(input)

  		valid_input = is_input_valid(input)

  		if valid_input == 0
  			continue_game_play input
  		end

  		Response.new(:message => @message, :status => @status)
  	end

  	def continue_game_play(input)
  		number_of_correct_elements = 0
  		right_position = 0

  		if input == @random_color_code
        
        sec = (Time.now - @start_time).to_i.abs
        min = sec / 60

  			@message = (<<-EOT)
Felicidades! Has adivinado la secuencia '#{input}' en #{@number_of_guesses} guesses durante #{min} minutos,
#{sec} segundos.
  			EOT

  			@status = :won
  		else
  			color_code = @random_color_code.split("")
  			input.split("").each_with_index do |letter, index| 
	  				right_position += 1 if letter == @random_color_code.split("")[index]

	  				if color_code.include? letter
	  					number_of_correct_elements += 1
	  					color_code.delete(letter)
	  				end
	  		end

	  		@number_of_guesses += 1
	  		@message = (<<-EOT)
#{input} tiene #{number_of_correct_elements} de los elementos correctos con #{right_position} en la posicion correcto.
Tu has tomado #{@number_of_guesses} adivina.
Supongo que otra vez!
	  			EOT

	  		@status = :continue
  		end
  	end

  	def is_input_valid(input)
  		result = input.length <=> @difficulty_level

  		if result == 0
  			result = 0
  		elsif result == -1

  			if input.downcase == 'd'
  				@message = "Adios"
  				@status = :quit
  			elsif input.downcase == 'c'
  				@message = "#{@random_color_code} es el codigo"
  				@status = :continue
  			else
  				@message = "Adivina es demasiado corto"
  				@status = :continue
  			end
 
  		elsif result == 1

  			if input.downcase == 'dejar'
  				@message = "Adios"
  				@status = :quit
  			elsif input.downcase == 'cheat'
  				@message = "#{@random_color_pattern} es el codigo"
  				@status = :continue
  			else
  				@message = "Adivina es demasiado largo"
  				@status = :continue
  			end

  		end

  		result
  	end
  end
end
