module TasksHelper
	def task_back_buttons
		if @task.project_id?
			link_to "< Back to project",  project_path(@task.project.id), class:"btn btn-default  btn-success pull-left "
			link_to 'Back to task list', tasks_path, class: 'btn btn-default  btn-warning pull-right '
		else
			link_to 'Back to task list', tasks_path, class: 'btn btn-default  btn-warning pull-right '
		end
	end




end

