
class Politwit < Sinatra::Base

  enable :sessions

  get '/tweets/results' do
    @tweets = Twit.new.get_tweets_for(session[:name]).flatten
    if @tweets.first.user.screen_name == "kingharmanalize"
      @tweets.clear
      flash.now[:error] = "Your search didn't match"
    end
    erb :'tweets/index'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    session[:name] = params[:name]
    redirect '/tweets/results'
  end

end
