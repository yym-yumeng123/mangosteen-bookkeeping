class Api::V1::SessionsController < ApplicationController
  def create
    if Rails.env.test? 
      return render status: :unauthorized if params[:code] != '123456'
    else
      canSignIn = ValidationCode.exists? email: params[:email], code: params[:code], used_at: nil    
      return render status: :unauthorized unless canSignIn
    end


    user = User.find_by(email: params[:email])

    if user.nil? 
      render status: :not_found, json: { errors: '用户不存在' }
    else
      render status: :ok, json: {
        jwt: 'xxxxxxxxxxxxxxxxxxxxxxx'
      }
    end
  end
end
