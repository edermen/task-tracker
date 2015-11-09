require 'rails_helper'
describe ProjectMember do

  subject { FactoryGirl.build(:project_member) }

	context "Associations" do
		it { is_expected.to belong_to(:user)}
		it { is_expected.to belong_to(:project)}
	end

	context 'Validations' do
		it { should validate_presence_of(:project_id) }
		it { should validate_presence_of(:user_id) }

		it { should validate_uniqueness_of(:project_id).scoped_to(:user_id) }
	end
end
