class Project < ActiveRecord::Base


	has_many :tasks, dependent: :destroy
	has_many :project_members, dependent: :destroy
	has_many :users, through: :project_members

	accepts_nested_attributes_for :project_members, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :tasks


	scope :tasks, 			    -> { joins(:tasks) }
  scope :project_members, -> { joins(:project_members) }


	validates	:name, :description,  presence: true
end
