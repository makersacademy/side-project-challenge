require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/project'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/supercrafts_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
