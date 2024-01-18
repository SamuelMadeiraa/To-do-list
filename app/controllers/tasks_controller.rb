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
        if @task.save
            redirect_to @task, notice: "Tarefs criada com sucesso"
        else
            render :new
        end
    end

    def edit
    end

    def update 
        if @task.update(task_paams)
            redirect_to @task, notice: "Tarefa atalizada com sucesso"
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to task_url, nitice: "Tarefa excluida com sucesso"
    end

    private

    def set_task
        @task = TAsk.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :description)
    end
end
