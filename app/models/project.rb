class Project < ActiveRecord::Base

	# RELATIONS
	has_many :tasks
	has_many :project_members
	has_many :users, through: :project_members
	#TODO add description links

	#VALIDATES
	validates(
		:name,
		presence: true
	)

end
