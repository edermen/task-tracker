require 'rails_helper'
describe "Show index page" do
	let(:user) {FactoryGirl.create(:user)}
	subject { page }
	before {
		visit(users_path)
	}

	context "have elements?" do
		it "have a title?" do
			expect(page).to have_selector('h1', text: "List of users")
		end
		it "have a content?" do
			expect(page).to have_selector('.login', text: user.login)
			expect(page).to have_selector('.login', text: user.login)
		end
	end
end
