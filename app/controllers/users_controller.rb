class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destroy]
  skip_before_action :authorize_request, only: [:new, :create]

  def show
    json_response(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      json_response(@user, :created)
    else 
      bad_request
    end
  end

  def edit
  end

  def update
    unless @user.update(user_params)
      bad_request
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
