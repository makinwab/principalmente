require_relative 'principalmente'

class Runner
	def run
		puts(<<-EOT)
Beinvenido a PRINCIPAL MENTE
Quiere (j)jugar, leer las (i)nstrucciones, o (d)dejar? 
		EOT

		game_entry = gets.chomp.downcase

		case game_entry
		when 'j', 'jugar'
			play
			run
		when 'i', 'instrucciones'
			puts 'instrucciones'
		when 'd', 'dejar'
			puts "Adios!"
		else
			puts 'Entra en la consola "j"jugar, "i"instrucciones, "d"dejar'
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

		until response && (response.status == :won || response.status == :quit)
			print "> "
			input = gets.chomp.upcase
			response =  principalmente.execute(input)
			puts response.message
		end
	end
end
