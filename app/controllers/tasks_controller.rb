class TasksController < ApplicationController
  before_action :set_task, only: [:index, :show, :edit, :update, :destroy]

	
	
  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.all
  end

  def show
    @project = Project.find(params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
				flash[:success] = 'Task was successfully created.'
        format.html { redirect_to project_path(params[:project_id]) }
			else
        format.html { render :new }
				flash.now[:warning] = 'Not Save!'
        
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_path(params[:project_id]) }
				flash[:success] = 'Task was successfully updated.'
			else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to :back }
			flash[:info] = 'Task was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name,:user_id, :project_id, :status)
    end
end
