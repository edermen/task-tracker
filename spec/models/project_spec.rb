require 'rails_helper'
describe Project do
	let(:project) { create(:project) }
  subject { project }
	context "Basic fields" do
		it { is_expected.to respond_to(:parent_id)  }
		it { is_expected.to respond_to(:name)  }
		it { is_expected.to respond_to(:description)  }
		
		context "validations" do
			context "Empty values" do
				it "Empty name" do
					project = Project.new(name: nil)
					project.valid?
					expect(project.errors[:name]).to include("can't be blank")
				end
				it "Empty description" do
					project = Project.new(description: nil)
					project.valid?
					expect(project.errors[:description]).to include("can't be blank")
				end
			end

			it "regexp validation" do
				project = Project.new(name: "#$$%", description: "fsdfs")
				expect(project.errors[:name]).to include("It's too short name!")
				expect(project.errors[:description]).to include("It's too short description!")

			end
		end
	end


end
