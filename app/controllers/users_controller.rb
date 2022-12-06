class UsersController < ApplicationController
  def create
    user = User.new name: 'yym'
    if user.save
      p '保存成功'
      render json: user
    else
      p '保存失败'
      render json: user.errors
    end
  end

  def show
    user = User.find_by id: params[:id]
    unless user.nil?
      render json: user
    else
      head 404
    end
  end
end
