require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:user)    { FactoryGirl.create(:user) }
  let!(:login_success) { login_user(user) }

  context "#if user not auhtorized" do
    it "#expected redirect to login_page" do
      logout_user
      get :index
      is_expected.to redirect_to(login_path)
    end
  end

  describe "#if login successful" do
    describe "GET 'index'"  do
      before { get :index }

      it "assign projects" do
        expect(assigns(:projects)).to eq(Project.all)
      end

      it "render 'new'" do
        is_expected.to render_template(:index)
      end
    end

    describe "GET 'show'" do
      before { get :show, { id: project.id } }

      it "assign project" do
        expect(assigns(:project)).to eq(project)
      end
      it "render 'show'" do
        is_expected.to render_template(:show)
      end
    end

    describe "GET 'new'" do
      before {  get :new, {id: project} }

      it "expected assigns of a new project" do
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "render 'new'" do
        is_expected.to render_template(:new)
      end
    end

    describe "GET edit" do
      before { get :edit, { id: project} }

      it "assign @project" do
        expect(assigns(:project)).to eq(project)
      end

      it "render 'edit'" do
        is_expected.to render_template(:edit)
      end
    end

    describe "POST create" do
      let(:project_attributes)  { FactoryGirl.attributes_for(:project) }
      before  { post :create, project: project_attributes }

      context "if valid parameters" do
        it "creates a new Project" do
          expect { post :create, project: project_attributes }.to change(Project, :count).by(1)
        end

        it "new record is presisted" do
          expect(assigns(:project)).to be_persisted
        end

        it "redirect to 'projects/:id'" do
          expect(response).to redirect_to(Project.last)
        end
      end

      context "if invalid parameter" do
        before do
          project_attributes[:name] = ""
          post :create, project: project_attributes
        end

        it "FAIL POST create" do
          expect { post :create, project: project_attributes }.to change(Project, :count).by(0)
        end

        it "render 'new'" do
          expect(response).to render_template("new")
        end

        it "not saved, return a new instance" do
          expect(assigns(:project)).to be_a_new(Project)
        end
      end
    end

    describe "PUT 'update'" do
      context "if update is successful" do
        project_attributes = { name: "test", description: "Test descriptions"}
        before  do
          put :update, id: project.id, project: project_attributes
          project.reload
        end

        it "redirect to 'projects/:id'" do
          expect(response).to redirect_to(project)
        end
      end

      context "if update is fail" do
        before  do
          project_attributes = { name: "", description: "Test descriptions"}
          put :update, id: project.id, project: project_attributes
          project.reload
        end

        it "render edit if invalid parameters" do
          expect(response).to render_template("edit")
        end
      end
    end

    describe "#DELETE destroy" do
      it "destroys the current project" do
        project
        expect { delete :destroy, id: project.id }.to change(Project, :count)
      end
    end
  end
end
