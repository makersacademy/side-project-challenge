ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class SuperCrafts < Sinatra::Base

require_relative 'data_mapper_setup'

get '/projects' do
  @projects = Project.all
  erb :'projects/index'
end

run! if app_file == $0
end
