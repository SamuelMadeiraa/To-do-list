class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def create
        @task = Task.new(task_params)
        @task.user_id = current_user
    end
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Tarefa atualizada com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_url, notice: 'Tarefa excluída com sucesso.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description)
    end
  end
  