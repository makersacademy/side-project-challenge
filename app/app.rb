require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'twitter_config'
require_relative 'meaningcloud_config'

class SentimentAnalysis < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'most secret'
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
    session[:tweets] = @tweets
    erb :'/search/results'
  end
  
  get '/search/analysis' do
    p "ceva"
    p session[:tweets]
    result = []
    
    session[:tweets].each do |tweet|
      result << MeaningCloud.analyse(tweet[:text])
    end
    p result
    erb :'/search/analysis'
  end
  
  helpers do
    
    def edit_score_tag(score_tag)
      case score_tag
      when "P+"
        "Strong positive"
      when "P"
        "Positive"
      when "NEU"
        "Neutral"
      when "N"
        "Negative"
      when "N+"
        "strong negative"
      when "NONE"
        "without sentiment"
      end
    end
    
  end
end
