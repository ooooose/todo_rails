class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "作成に成功しました！"
      redirect_to tasks_url
    else
      render :new
    end
  end
  

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "編集が成功しました！"
      redirect_to tasks_url
    else
      render :edit
    end
  end

  def new
    @task = Task.new
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:success] = "削除に成功しました"
    redirect_to tasks_url
  end
  
  
  private
    def task_params
      params.require(:task).permit(:title,:content,:duedate)
    end
  
end
