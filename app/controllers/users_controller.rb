class UsersController < ApplicationController
  def create
    user = User.new email: "1@qq.com", name: "y1"
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by_id params[:id]
    if user
      redner json: user
    else
      head 404
    end
  end
end
