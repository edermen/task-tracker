class ProjectMember < ActiveRecord::Base

	belongs_to :project
	belongs_to :user



	validates_uniqueness_of :project_id, value: true,  scope: [:user_id], message: 	"User already assigned on project"
	validates :project_id , presence: true, numericality: {only_integer: true}
	validates :user_id, presence: true, numericality: {only_integer: true, message: "- choose a user in the  list"}

end
