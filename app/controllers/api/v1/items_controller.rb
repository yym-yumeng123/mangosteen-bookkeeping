class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.page(params[:page])
    render json: { resources: items }, status: :ok
  end

  def create
    item = Item.new amount: params[:amount]
    if item.save
      render json: { resouce: item }, status: :created
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end
end
