class Post

  include DataMapper::Resource

  has n, :likes, :through => Resource

  property :id,           Serial
  property :title,        String, :required => true

end
