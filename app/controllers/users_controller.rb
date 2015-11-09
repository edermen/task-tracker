class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
	add_breadcrumb "Home", :root_path
	add_breadcrumb "List users", :users_path

  def index
    @users = User.all

  end

  def show
		add_breadcrumb @user.login
  end

  def new
    @user = User.new
		add_breadcrumb "New"
  end

  def edit
		add_breadcrumb "Edit user:  #{@user.login}"
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
