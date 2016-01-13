require_relative "message_helper"

class Response
  attr_reader :status

  def initialize(status)
    @status = status
    respond
  end

  def respond
    case @status
    when :start, :won
      Principalmente::MessageHelper.new.start
    when :pre_play
      Principalmente::MessageHelper.new.pre_play
    when :b_play
      Principalmente::MessageHelper.new.beginner_play
    when :i_play
      Principalmente::MessageHelper.new.intermediate_play
    when :a_play
      Principalmente::MessageHelper.new.advanced_play
    when :quit
      Principalmente::MessageHelper.new.exit
    end
  end
end
