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
    project = Project.create(title: params[:title],
    material_1: params[:material_1],
    material_2: params[:material_2],
    instructions: params[:instructions],
    image_URL: params[:image_URL],
    author: params[:author])
    redirect '/projects'
  end

  get "/projects/:project_id" do
    @project = Project.first(id: params[:project_id])
    erb :'projects/project'
  end

  post '/search' do
    if !params[:material_2]
      redirect "/search/#{CGI::escape(params[:material_1])}"
    else
      redirect "/search/#{CGI::escape(params[:material_1])}&#{CGI::escape(params[:material_2])}"
    end
  end

  get '/search/:material_1&:material_2' do
    @projects = Project.all(material_1: params[:material_1], material_2: params[:material_2])
    erb :'projects/index'
  end

  get '/search/:material_1&' do
    @projects = Project.all(material_1: params[:material_1], :material_2 => '')
    erb :'projects/index'
  end

  run! if app_file == $0
end
