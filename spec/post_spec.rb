require 'spec_helper'

describe Post do

  context 'Demonstration of how datamapper works' do

    # This is not a real test, it's simply a demo of how it works
    it 'should be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no links
      expect(Post.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      Post.create(title: 'Meeting with Google')
      # We ask the database how many links we have, it should be 1
      expect(Post.count).to eq(1)
      # Let's get the first (and only) link from the database
      post = Post.first
      # Now it has all properties that it was saved with.
      expect(post.title).to eq('Meeting with Google')
      # If we want to, we can destroy it
      post.destroy
      # so now we have no links in the database
      expect(Post.count).to eq(0)
    end

  end

end
