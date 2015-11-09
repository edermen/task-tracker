FactoryGirl.define do

	# TASK FACTORIES
	factory :task, aliases: [:tasks] do
		name { "#{Faker::Hacker.verb} #{Faker::App.name} v:#{Faker::App.version}" }

		trait :project_id do
			project_id { Faker::Number.digit }
		end

	end
end