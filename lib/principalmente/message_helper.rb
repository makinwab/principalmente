require "colorize"

module Principalmente
  class MessageHelper
    def welcome
      puts "Bienvenido a PRINCIPAL MENTE".cyan
    end

    def start
      puts "Quieres (j)jugar, leer las (i)nstrucciones, o (d)dejar?".magenta
      print "-"
    end

    def beginner_play
      puts "He generado un principiante secuencia"\
      " con cuatro elementos de (r)rojo,"\
      "(v)verde, (a)azul, y a(m)marillo. Usa (d)dejar para dejar el juego."\
      " Usa (d)dejar para dejar el juego."\
      "Que tu adivina?".magenta
    end

    def intermediate_play
      puts "He generado un principiante secuencia con cinco"\
      " elementos de (r)rojo,"\
      "(v)verde, (a)azul, a(m)marillo, (n)aranja y (c)ian."\
      " Usa (d)dejar para dejar el juego."\
      "Que tu adivina?".magenta
    end

    def advanced_play
      puts "He generado un principiante secuencia"\
      " con seis elementos de (r)rojo,"\
      "(v)verde, (a)azul, a(m)marillo, (n)aranja, (c)ian, ma(g)enta y (p)lata."\
      " Usa (d)dejar para dejar el juego."\
      "Que tu adivina?".magenta
    end

    def win(input, guess_number, min, sec)
      puts "Felicidades!!!\n Has adivinado la secuencia"\
      " '#{input.upcase}' en #{guess_number}"\
      " guesses durante #{min} minuto(s),#{sec} segundo(s).".green
    end

    def exit
      puts ":( Adios!!!".magenta
    end

    def instructions
      start
    end

    def pre_play
      puts "Entra nivel de juego como (p)principiante"\
      ", (i)intermedio or (a)avanzado".magenta
    end

    def game(input, no_of_correct_elements, right_pos, guess_no)
      puts "#{input.upcase} tiene #{no_of_correct_elements}"\
      " de los elementos correctos con"\
      " #{right_pos} en la posicion correcto.\n"\
      "Tu has tomado #{guess_no} adivina.\n"\
      "Supongo que otra vez!".red
    end

    def cheat(color_code)
      puts "#{color_code.upcase} es el codigo".magenta
    end

    def short_code
      puts "Adivina es demasiado corto".red
    end

    def long_code
      puts "Adivina es demasiado largo".red
    end
  end
end
