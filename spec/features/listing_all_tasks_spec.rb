require 'spec_helper'

feature "User browses the list of tasks" do

  before(:each) {
    Task.create(:title => "Harro")
    }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Harro")
  end
end
