class ProjectMembersController < ApplicationController

	def create
		@project_members = ProjectMember.create(project_members_params)

		if @project_members.user.nil?
			redirect_to project_path(project_members_params[:project_id])
			flash[:danger] = 'select user from the list.'
		else
			respond_to do |format|
				if @project_members.save
					format.html { redirect_to project_path(@project_members.project_id)   }
					flash[:success] = 'Member successfully added.'
        else
          # binding.pry
					format.html { redirect_to project_path(@project_members.project_id)   }
					flash[:danger] = @project_members.errors.messages[:project_id][0]
				end
			end
		end

	end

	def destroy
		# binding.pry
		@project_member.destroy
		respond_to do |format|
			format.html { redirect_to project_path(project_members_params) }
			flash[:warning] = 'The user was deleted from the project'
		end
	end

	private
	def project_members_params
		params.require(:project_member).permit(:project_id, :user_id)
	end
end





