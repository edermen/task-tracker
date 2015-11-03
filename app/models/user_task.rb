class UserTask < ActiveRecord::Base
	has_many :tasks
	belongs_to :project_member
end