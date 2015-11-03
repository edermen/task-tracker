namespace :db do
	desc "Fill in project examples"
	task fill_project: :environment do
		40.times do
      parent_id  	= nil
			name 				= "#{Faker::Hacker.verb} #{Faker::App.name} v:#{Faker::App.version}"
			description = Faker::Lorem.sentence(24)

			Project.create(parent_id: parent_id, name: name, description: description)

		end

	end
end