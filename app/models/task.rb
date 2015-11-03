class Task < ActiveRecord::Base
  belongs_to :project
	belongs_to :user_task
  #TODO add description links

	# VALIDATES
	validates(
		:name,
		presence: true
		#TODO add: regexp validation, length validations
	)

end
