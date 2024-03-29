class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new(description: params[:task][:description], due_date: params[:task][:due_date], task_list_id: params[:task_list_id])
    if @task.save
      redirect_to root_path, notice: "Task was created successfully!"
    else
      render :new
    end
    end
end