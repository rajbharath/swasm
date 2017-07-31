class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def authorize_user!
    authorize (params[:id] && User.find(params[:id])) || User
  end
end
