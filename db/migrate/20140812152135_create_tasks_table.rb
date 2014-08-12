class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.timestamp
      t.string :description, null: false
      t.datetime :due_date
      t.belongs_to :task_list
    end
  end
end
