require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class SentimentAnalysis < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  
  
end
