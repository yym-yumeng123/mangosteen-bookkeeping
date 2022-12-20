class Api::V1::ValidationCodesController < ApplicationController
  def create
    validation_code = ValidationCode.new email: params[:email], code: code, kind: 'sign_in'
    if validation_code.save
      render status: :created
    else
      render json: { errors: validation_code.errors }, status: :unprocessable_entity
    end
  end
end
