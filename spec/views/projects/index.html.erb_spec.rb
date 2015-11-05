require 'rails_helper'
describe "Project#index" do
	let(:user) {FactoryGirl.create(:user)}
	subject { page }
	before {visit projects_path}
	context "if no login user" do
	  it { expect(page).to have_css('.form-horizontal')}
	  it { expect(page).not_to have_css('.h1', text: "Projects")}
	end

	context "if log in user" do
		before do
			fill_in "sessions_email",			with: user.email
			fill_in "sessions_password", 	with: user.password
			click_button "Sign in"
		end
		it "successful logon" do
			expect(page).to have_css('.label-success', text: "You are loged in")
			end
		it "failure login" do
			fill_in "sessions_email", with: ""
			expect(page).to have_css('.label-success', text: "Invalid email/password ")
		end
	end
end
