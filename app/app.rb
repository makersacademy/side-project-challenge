require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'twitter_config'

class SentimentAnalysis < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  
  get '/' do
    erb :index
  end
  
  post '/search' do
    session[:search] = params[:search]
    redirect '/search/results'
  end
  
  get '/search/results' do
    erb :'/search/results'
  end
  
end
