require 'rails_helper'
describe Project do
	let(:project) { create(:project) }
  subject { project }
	context "Basic fields" do
		it { is_expected.to respond_to(:parent_id)  }
		it { is_expected.to respond_to(:name)  }
		it { is_expected.to respond_to(:description)  }
		
		context "validations" do
			it "Empty values" do
				expect(project.name).not_to be_empty
				expect(project.description).not_to be_empty
			end

			it "regexp validation" do
				expect(project.name).to 			 match(/[A-z$%, !?.-]{6,}/)
				expect(project.description).to match(/[A-z$%, !?.-]{10,}/)
			end
		end
	end


end
