class Task < ActiveRecord::Base
	extend Enumerize
  enumerize :status, in: [:new, :in_progress, :resolved, :closed]

  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :project_id,  numericality: {only_integer: true, allow_nil: true}
  validates :user_id,  numericality: {only_integer: true, allow_nil: true}

end
