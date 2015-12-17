require_relative 'response'
require_relative 'version'

module Principalmente
  class Mastermind
  	COLOR_CODE = ['R', 'V', 'A', 'M']

  	attr_reader :level, :guess

  	def initialize
  		@level = 4
  		@guess = 0
  		@random_color_pattern = Array.new(@level) { COLOR_CODE.sample }.join('').upcase
  		puts @random_color_pattern
  	end

  	def execute(input)
  		right_pos = 0
  		correct_elements = 0
  		mensaje = ""
  		time_taken = 4
  		
  		if input.length < @level
  			Response.new(:message => "Adivina es demasiado corto", :status => :continue)
  		elsif input.length > @level
  			Response.new(:message => "Adivina es demasiado largo", :status => :continue) 
  		end

  		case input
  		when 'd','dejar'
  			Response.new(:message => "Adios!", :status => :quit)
  		when 'c','cheat'
  			Response.new(:message => "#{@random_color_pattern} es el codigo", :status => :continue)
  		when @random_color_pattern
  			mensaje = (<<-EOT)
Felicidades! Has adivinado la secuencia '#{input}' en #{@guess} guesses durante #{time_taken} minutos,
22 segundos.
Quieres (j)ugar de nuevo o (d)ejar?
  			EOT

  			Response.new(:message => mensaje, :status => :won)
  		else
  			input.split("").each_with_index do |letter, index| 
  				right_pos += 1 if letter == @random_color_pattern.split("")[index]

  				correct_elements += 1 if @random_color_pattern.split("").include? letter
  			end

  			@guess += 1
  			mensaje = (<<-EOT)
#{input} tiene #{correct_elements} de los elementos correctos con #{right_pos} en la posicion correcto.
Tu has tomado #{@guess} adivina.
Supongo que otra vez!
  			EOT

  			Response.new(:message => mensaje, :status => :continue)
  		end

  	end
  end
end
