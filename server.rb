require 'sinatra'

require 'data_mapper'
require 'json'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "learn_ssu_" or "learn_ssu_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/learn_ssu_#{env}")

require './lib/post' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!


get '/' do
  @posts = Post.all
  erb :index
end

get '/about' do
  erb :about
end

post '/posts' do
    title = params["title"]
    Post.create(:title => title)
    redirect('/')
end
