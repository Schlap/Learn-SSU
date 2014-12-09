require 'spec_helper'

feature "User browses the list of tasks" do

  before(:each) {
    Task.create(:description => "Need to schedule this by this afternoon",
    :title => "Meeting with Google")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Meeting with Google")
  end
end
