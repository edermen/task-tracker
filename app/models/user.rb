class User < ActiveRecord::Base
  authenticates_with_sorcery!

	# RELATIONS
	has_many :project_members
	has_many :projects, through: :project_members
  has_many :tasks



  validates	:login,	length: {in: 5..70	}
	validates	:email,	uniqueness: true , email_format: { message: "Wrong email format" }
	validates	:password,length: { minimum: 3 },	confirmation: true

end
