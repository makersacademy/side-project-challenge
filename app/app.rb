require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'twitter_config'

class SentimentAnalysis < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  use Rack::MethodOverride
  
  get '/' do
    erb :index
  end
  
  post '/search' do
    session[:search] = params[:search]
    redirect '/search/results'
  end
  
  get '/search/results' do
    @tweets = TwitterApi.search(session[:search])
    erb :'/search/results'
  end
  
  get '/search/analysis' do
    
    redirect '/search/results'
  end
  
end
