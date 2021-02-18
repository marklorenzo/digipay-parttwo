class UsersController < ApplicationController
  before_action :build_user, only: [:create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render body: nil, status: 200
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :name,
        :email
      )
    end
  def build_user
    @user = User.new(user_params)
  end    
end
