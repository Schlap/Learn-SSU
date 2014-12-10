require 'sinatra'

require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "streetsmarttaskboard_" or "streetsmarttaskboard_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/streetsmarttaskboard_#{env}")

require './lib/task' # this needs to be done after datamapper is initialised

require './lib/tag' # this needs to be done after datamapper has initialised

require './lib/like'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

get '/' do
  @tasks = Task.all
  @likes = Like.all
  erb :index
end

post '/tasks' do
    title = params["title"]
    Task.create(:title => title)
    redirect('/')
end
