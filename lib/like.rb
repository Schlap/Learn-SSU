class Like

  include DataMapper::Resource
  property :id,     Serial
  belongs_to :task
end
