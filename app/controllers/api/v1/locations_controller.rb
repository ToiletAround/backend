class Api::V1::LocationsController < ApplicationController
  before_action :find_location, only: [:show, :update, :destroy]

  def index
    @locations = Location.all
    render json: @locations
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render json: @location
    else
      render json: { error: 'Unable to create location' }, status: 400
    end
  rescue StandardError
    render json: { error: 'Unable to create location' }, status: 400
  end

  def update
    if @location
      @location.update(location_params)
      render json: { message: 'Location successfuly updated' }, status: 400
    else
      render json: { error: 'Unable to update location' }, status: 400
    end
  end

  def destroy
    if @location
      @location.destroy
      render json: { message: 'Location successfuly deleted'}, status: 200
    else
      render json: { error: 'Unable to delete location'}, status: 400
    end
  end

  private

  def location_params
    params.permit(:latitude, :longitude, :toilet_id)
  end

  def find_location
    @location = Location.find(params[:id])
  end
end
