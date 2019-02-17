require 'rack'
require_relative 'time_formated'
require_relative 'app'

run App.new
