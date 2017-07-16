class Project

include DataMapper::Resource

property :id, Serial
property :title, String
property :material_1, Text
property :material_2, Text
property :instructions, Text
property :image_URL, Text
property :author, String


end
