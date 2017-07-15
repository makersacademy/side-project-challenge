ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class SuperCrafts < Sinatra::Base

  require_relative 'data_mapper_setup'

  get '/' do
    erb :'home'
  end

  get '/projects' do
    @projects = Project.all.reverse
    erb :'/projects/index'
  end

  get '/projects/new' do
    erb :'/projects/new'
  end

  post '/projects' do
    Project.create(title: params[:title],
    materials: params[:materials],
    instructions: params[:instructions])
    redirect '/projects'
  end

  post '/search' do
    redirect "/search/#{CGI::escape(params[:materials])}"
  end

  get '/search/:materials' do
    @projects = Project.all(materials: params[:materials])
    erb :'projects/index'
  end

  run! if app_file == $0
end
