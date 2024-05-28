# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'New Task was successfully created'

      redirect_to task_path(@task)
    else
      flash[:failure] = "Task cannot be created. Error: #{@task.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated'

      redirect_to task_path(@task)
    else
      flash[:failure] = "Task cannot be updated. Error: #{@task.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task was successfully deleted'

      redirect_to tasks_path
    else
      flash[:failure] = "Task cannot be deleted. Error: #{@task.errors.full_messages}"
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
