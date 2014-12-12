require 'spec_helper'

feature 'liking post' do
  before(:each){
    Post.create(:title => "Harro")
  }

  scenario 'when browsing the list of posts' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end
end
