class User < ActiveRecord::Base
  authenticates_with_sorcery!
	# RELATIONS
	has_many :project_members
	has_many :projects, through: :project_members

  validates(
		:login,
		length: {in: 6..70	}
	)
	validates(
		:password,
		length: { minimum: 3 },
		confirmation: true
	)
	validates(
		:email,
		uniqueness: true
	)

end
