class Api::V1::PricesController < ApplicationController
  before_action :find_price, only: [:show, :update, :destroy]

  def index
    @prices = Price.all
    render json: @prices
  end

  def show
    render json: @price
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      render json: @price
    else
      render json: { error: 'Unable to create price' }, status: 400
    end
  end

  def update
    if @price
      @price.update(price_params)
      render json: { message: 'Price successfuly updated' }, status: 400
    else
      render json: { error: 'Unable to update price' }, status: 400
    end
  end

  def destroy
    if @price
      @price.destroy
      render json: { message: 'Price successfuly deleted'}, status: 200
    else
      render json: { error: 'Unable to delete price'}, status: 400
    end
  end

  private

  def price_params
    params.permit(:price, :toilet_id)
  end

  def find_price
    @price = Price.find(params[:id])
  end
end
