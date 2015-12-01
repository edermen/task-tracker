require 'rails_helper'
describe SessionsController, type: :controller  do
  let(:current_user) { FactoryGirl.create(:user) }

  describe "POST 'create'" do
    context "if invalid authorization parameter" do
      let(:user_attributes)  { FactoryGirl.attributes_for(:user) }
      before do
        binding.pry
        current_user.email = ''
        current_user.login = ''
        post :create, login_user: user_attributes

        binding.pry
      end
      it "flash error message" do
        is_expected.to redirect_to(login_path)
        expect(flash[:danger]).not_to be_nil
      end
    end
  end
end