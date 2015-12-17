require 'colorize'
require_relative 'principalmente'

class Runner
	def run
		puts "Quieres (j)jugar, leer las (i)nstrucciones, o (d)dejar?".magenta
		print "- "
		game_entry = gets.chomp.downcase

		case game_entry
		when 'j', 'jugar'
			play
		when 'i', 'instrucciones'
			run
		when 'd', 'dejar'
			puts "Adios!".green
			return
		else
			puts 'Entra en la consola "j"jugar, "i"instrucciones, "d"dejar'.red
			run
		end

	end

	def play
		puts(<<-EOT)
He generado un principiante secuencia con cuatro elementos de (r)rojo,
(v)verde, (a)azul, y a(m)marillo. Usa (d)dejar para dejar el juego.
Que tu adivina? 
		EOT

		principalmente = Principalmente::Mastermind.new
		response = nil
		

		until response && response.status == :quit
			print "> "
			input = gets.chomp.upcase
			response =  principalmente.execute(input)
			color = (response && response.status == :won) ? :green : :red
			puts response.message.colorize(color)

			if response.status == :won
				run
				break
			end
		end
	end
end
