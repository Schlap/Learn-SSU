class Tag
   include DataMapper::Resource

   has n, :tasks, :through => Resource

   property :id,    Serial
   property :text,  String

end
