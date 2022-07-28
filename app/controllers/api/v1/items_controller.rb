class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.page(1).per(10)
    render json: items, status: :ok
  end
  
  def create
    item = Item.new amount: 1
    if item.save
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end
  
end
