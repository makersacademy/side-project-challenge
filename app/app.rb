ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'

require_relative './models/collator'
require_relative './models/twitter'
require_relative './models/parser'

require_relative './controllers/tweets'
