class Project < ActiveRecord::Base

	# RELATIONS
	has_many :tasks, dependent: :destroy
	has_many :project_members, dependent: :destroy
	has_many :users, through: :project_members


	accepts_nested_attributes_for :project_members, reject_if: :all_blank, allow_destroy: true

	# SCOPES
	scope :tasks, 			-> { joins(:tasks) }
  scope :closed_task, -> { tasks.where(tasks: { status: "closed"} ) }

	#VALIDATES
	validates	:name, :description,  presence: true






end
