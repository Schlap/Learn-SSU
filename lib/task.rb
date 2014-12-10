class Task

  include DataMapper::Resource
  # create a one to many relationship between tags and tasks
  has n, :likes, :through => Resource

  property :id,           Serial
  property :title,        String
  property :description,  String

end
