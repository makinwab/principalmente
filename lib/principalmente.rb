require 'colorize'
require_relative 'principalmente/game'
require_relative 'principalmente/message_helper'

Principalmente::MessageHelper.new.welcome_message
Principalmente::Game.new.start