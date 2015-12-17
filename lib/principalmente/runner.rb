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
		principalmente = Principalmente::Mastermind.new
		response = nil

		until response && response.status == :won
			print "> "
			input = gets.chomp.upcase
			response =  principalmente.execute(input)
			puts response.message
		end
	end
end
