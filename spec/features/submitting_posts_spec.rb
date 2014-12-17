require 'spec_helper'

feature 'User submits a new post' do
  scenario 'whilst on the homepage' do
    expect(Post.count).to eq(0)
    visit '/'
    add_post("Organise meeting with Alan Lim")
    expect(Post.count).to eq (1)
    post = Post.first
    expect(post.title).to eq("Organise meeting with Alan Lim")
  end

  def add_post(title)
    within('.form-group') do
    fill_in 'title', :with => title
    click_button 'Post'
    end
  end
end
