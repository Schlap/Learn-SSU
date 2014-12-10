require 'spec_helper'

feature 'User submits a new task' do
  scenario 'whilst on the homepage' do
    expect(Task.count).to eq(0)
    visit '/'
    add_task("Organise meeting with Alan Lim")
    expect(Task.count).to eq (1)
    task = Task.first
    expect(task.title).to eq("Organise meeting with Alan Lim")
  end

  def add_task(title)
    within('.new-task') do
    fill_in 'title', :with => title
    click_button 'Post'
    end
  end
end
