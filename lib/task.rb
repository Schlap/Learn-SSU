class Task

  include DataMapper::Resource

  # create a many to many relationship between tags and tasks
  has n, :tags, :through => Resource

  property :id,           Serial
  property :title,        String
  property :description,  String

end
