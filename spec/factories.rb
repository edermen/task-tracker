FactoryGirl.define do

	factory :project do
		parent_id 	{Faker::Number.digit}
    name 				{"#{Faker::Hacker.verb} #{Faker::App.name} v:#{Faker::App.version}"}
    description {Faker::Lorem.sentence(24)}
	end

end