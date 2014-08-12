require 'rails_helper'

feature 'user can add a task to a task list' do
  scenario 'user can add a task' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")

    within(".Household.Chores") do
      click_on 'New Task'
    end
    fill_in 'task[description]', with: 'awesomeness'
    select '2014', from: 'task[due_date(1i)]'
    select 'August', from: 'task[due_date(2i)]'
    select '13', from: 'task[due_date(3i)]'

    click_on 'Create Task'
    expect(page).to have_content 'awesomeness'
    expect(page).to have_content 'Task was created successfully!'
  end
  
end
