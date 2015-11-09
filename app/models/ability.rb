class Ability
  include CanCan::Ability

  def initialize(user)

		user ||= User.new

		if user.role_id == 1
			can :manage, :all
		else
			can [:read, :create, :update], Project, Task
		end

  end
end
