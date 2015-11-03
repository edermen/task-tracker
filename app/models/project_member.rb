class ProjectMember < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	has_many :user_tasks
end
