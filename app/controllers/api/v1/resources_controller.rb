class Api::V1::ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :update, :destroy]

  def index
    @resources = Resource.all
    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      render json: @resource
    else
      render json: { error: 'Unable to create resource' }, status: 400
    end
  end

  def update
    if @resource
      @resource.update(resource_params)
      render json: { message: 'Resource successfuly updated' }, status: 400
    else
      render json: { error: 'Unable to update resource' }, status: 400
    end
  end

  def destroy
    if @resource
      @resource.destroy
      render json: { message: 'Resource successfuly deleted'}, status: 200
    else
      render json: { error: 'Unable to delete resource'}, status: 400
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :toilet_id)
  end

  def find_resource
    @resource = Resource.find(params[:id])
  end
end
