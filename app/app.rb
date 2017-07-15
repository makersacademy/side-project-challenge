ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class SuperCrafts < Sinatra::Base

  require_relative 'data_mapper_setup'

  get '/projects' do
    @projects = Project.all.reverse
    erb :'/projects/index'
  end

  get '/projects/new' do
    erb :'/projects/new'
  end

  post '/projects' do
    Project.create(title: params[:title], materials: params[:materials], instructions: params[:instructions])
    redirect '/projects'
  end


  run! if app_file == $0
end
