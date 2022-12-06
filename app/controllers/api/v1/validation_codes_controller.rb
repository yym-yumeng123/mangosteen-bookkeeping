class Api::V1::ValidationCodesController < ApplicationController
  def create
    code = SecureRandom.random_number.to_s[2..7]
    validation_code = ValidationCode.new email: params[:email], code: code, kind: 'sign_in'
    if validation_code.save
      # render json: { resouce: validation_code }, status: :created
      head 200
    else
      render json: { errors: validation_code.errors }, status: :unprocessable_entity
    end
  end
end
