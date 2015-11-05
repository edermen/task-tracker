require 'rails_helper'

describe User do

	context "validations" do
		it "Empty value" do
			user = User.new(login: nil, email: nil, password: nil)
			user.valid?
			expect(user.errors[:login]).to 		include(match(/is too short/))
			expect(user.errors[:email]).to 		include(match(/is too short/))
			expect(user.errors[:password]).to include(match(/is too short/))
		end

		it "Regex validation" do
			user = User.new(login: nil, email: nil, password: nil)
			user.valid?
			expect(user.errors[:login]).to 		include(match(/is too short/))
			expect(user.errors[:email]).to 		include(match(/is too short/))
			expect(user.errors[:password]).to include(match(/is too short/))
		end
	end
end