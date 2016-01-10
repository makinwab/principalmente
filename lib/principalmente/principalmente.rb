require_relative "message_helper"
require_relative "version"

module Principalmente
  class Mastermind
    COLOR_MAP = {
      p: %w(a r v m),
      i: %w(a r v m n c),
      a: %w(a r v m n c g p)
    }

    attr_accessor :number_of_guesses,
                  :status,
                  :random_color_code,
                  :message_helper

    def initialize(level_entry, level)
      @number_of_guesses = 0
      @start_time = Time.now
      @difficulty_level = level
      @message_helper = Principalmente::MessageHelper.new

      @random_color_code = self.class.generate_color_code level_entry, level
    end

    def self.generate_color_code(level_entry, level)
      Array.new(level) { COLOR_MAP[level_entry].sample }.join
    end

    def execute(input)
      result = parse_input(input)

      if result == 0
        continue_game_play input
      end

      @status
    end

    def continue_game_play(input)
      @number_of_guesses += 1

      if input == @random_color_code
        process_win input
      else
        process_fail input
      end
    end

    def process_win(input)
      @message_helper.win_message(
        input,
        @number_of_guesses,
        parse_time[:min],
        parse_time[:sec]
      )

      @status = :won
    end

    def process_fail(input)
      number_of_correct_elements = 0
      right_position = 0
      color_code = @random_color_code.split("")

      input.split("").each_with_index do |letter, index|
        right_position += 1 if letter == @random_color_code.split("")[index]
        if color_code.include? letter
          number_of_correct_elements += 1
          color_code.delete letter
        end
      end

      @message_helper.game_message(
        input,
        number_of_correct_elements,
        right_position,
        @number_of_guesses
      )

      @status = :continue
    end

    private

    def parse_time
      t = (Time.now - @start_time)
      min, sec = t.divmod(60)
      hh, min = min.divmod(60)

      { min: min.floor, sec: sec.floor, hh: hh.floor }
    end

    def parse_input(input)
      result = nil

      case input
      when "d", "dejar"
        @status = :quit
      when "c", "cheat"
        @status = :continue
        @message_helper.cheat_message @random_color_code
      else
        result = check_input_size(input)
      end

      result
    end

    def check_input_size(input)
      result = input.length <=> @difficulty_level
      if result == 1
        @message_helper.long_code_message
      elsif result == -1
        @message_helper.short_code_message
      end

      @status = :continue

      result
    end
  end
end
