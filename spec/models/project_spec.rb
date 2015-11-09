require 'rails_helper'
describe Project do
	let(:project) { FactoryGirl.build(:project) }
	context "Field validations" do
		it 'Empty name' do
			project.name = ''
			expect(project).not_to be_valid
		end
		it 'Empty description' do
			expect(build(:project, :empty_description)).not_to be_valid
		end
	end

	context "relations validations" do
		it { should have_many(:tasks) }
		it { should have_many(:users) }
		it { should accept_nested_attributes_for(:project_members) }
	end
end
