class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to products_path, alert: "You have successfully signed up."
  	else
  		flash[:alert] = "Please check errors and try again."
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		redirect_to @user, alert: "Profile has been updated."
  	else
  		flash[:alert] = "Please check errors and try again."
  		render :edit
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end

  	def set_user
  		@user = User.find(params[:id])
  	end
end
