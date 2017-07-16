class Project

include DataMapper::Resource

property :id, Serial
property :title, String
property :materials, String
property :instructions, Text
property :image_URL, String
property :author, String


end
