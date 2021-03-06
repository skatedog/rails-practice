class UsersController < ApplicationController
  def index
    users = User.all
    render json: { data: users }
  end
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessabele_entity
    end
  end

  private

  def user_params
    params.permit(:name)
  end
end
