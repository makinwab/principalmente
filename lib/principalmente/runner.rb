require './lib/principalmente'

class Runner
	def run
		puts "Bienvenido a principal mente"

		principalmente = Principalmente::Mastermind.new
		response = nil 

		until response && response.status == :won
			print "> "
			input = gets.chomp
			response =  principalmente.execute(input)
			puts response.message
		end

		puts "Adios!"
	end
end