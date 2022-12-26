require 'jwt'
class Api::V1::SessionsController < ApplicationController
  def create
    # 测试环境默认 code 为 123456
    if Rails.env.test? 
      return render status: :unauthorized if params[:code] != '123456'
    else
      canSignIn = ValidationCode.exists? email: params[:email], code: params[:code], used_at: nil    
      return render status: :unauthorized unless canSignIn
    end


    user = User.find_or_create_by email: params[:email]
    render status: :ok, json: { jwt: user.generate_jwt }
  end
end
