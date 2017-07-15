class Project

include DataMapper::Resource

property :id, Serial
property :title, String
property :materials, String
property :instructions, String 

end
