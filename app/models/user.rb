class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
	has_many :project_members
	has_many :projects, through: :project_members
  has_many :tasks

  scope :project_members,   -> { includes(:project_members) }
  scope :users_on_project,  ->(project_id) {project_members.where(project_members: {project_id: project_id}) }
  scope :not_in_project,    ->(project_id) { where("users.id NOT IN (?)", users_on_project(project_id).pluck(:id)) }

  validates	:login,	length: {in: 5..70	}
	validates	:email,	uniqueness: true , email_format: { message: "Wrong email format" }
	validates	:password,length: { minimum: 3 },	confirmation: true

end
