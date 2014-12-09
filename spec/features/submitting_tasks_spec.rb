require 'spec_helper'

feature 'User submits a new task' do
  scenario 'whilst on the homepage' do
    expect(Task.count).to eq(0)
    visit '/'
    add_task("Need to make a sale lah", "Organise meeting with Alan Lim")
    expect(Task.count).to eq (1)
    task = Task.first
    expect(task.description).to eq("Need to make a sale lah")
    expect(task.title).to eq("Organise meeting with Alan Lim")
  end

  def add_task(description, title)
    within('.new-task') do
      fill_in 'description', :with => description
      fill_in 'title', :with => title
      click_button 'Submit'
    end
  end
end
