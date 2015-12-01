class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
		@project.tasks.build
		
	end

	def edit
	end
 
	def create
		@project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project }
				flash[:success] = 'Project was successfully created.'
			else
				format.html { render :new }
				flash[:warning] = 'Not Saved!'
			end
		end
	end

	def update
		respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
				flash[:success] = 'Project was successfully updated.'
      else
				# binding.pry
				format.html { render :edit }
				
			end
		end
  end

  def destroy
    @project.destroy
    # binding.pry
    respond_to do |format|
			format.html { redirect_to projects_url }
			flash[:warning] = 'Project was successfully destroyed.'
		end
	end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description,
				project_members: [:project_id, :user_id],
				tasks: [:name, :project_id, :status]
			)
    end
end
