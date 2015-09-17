ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '../config/env.rb')

require 'ansi'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/reporters/turn_again_reporter'
Minitest::Reporters.use!(Minitest::Reporters::TurnAgainReporter.new)
