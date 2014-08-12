require 'rails_helper'

describe Task do
  it 'will not save if the description is blank' do
    tasklist = TaskList.create!(name: 'Household Chores')
    task = Task.create(description: '', task_list_id: tasklist.id, due_date: '2014-08-14')
    expect(task).to_not be_valid
    expect(task).to have(1).errors_on(:description)
  end
end