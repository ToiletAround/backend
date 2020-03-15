class Api::V1::ToiletsController < ApplicationController

  # GET /toilets
  def index
    @toilets = Toilet.all
    render json: @toilets
  end

  # GET /toilets/{:id}
  def show
    @toilet = Toilet.find(params[:id])
    render json: @toilet.to_json(include: :location)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Unable to find toilet' }, status: 400
  end

  # POST /toilets
  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      render json: @toilet
    else
      render json: { error: 'Unable to Create toilet' }, status: 400
    end
  end

  # PUT /toilets/{:id}
  def update
    @toilet = Toilet.find(params[:id])
    if @toilet
      @toilet.update(toilet_params)
      render json: { message: 'Toilet successfully updated' }, status: 200
    else
      render json: { error: 'Unable to update Toilet' }, status: 400
    end
  end

  # DELETE /toilets/{:id}
  def destroy
    @toilet = Toilet.find(params[:id])
    if @toilet
      @toilet.destroy
      render json: { message: 'Toilet successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Toilet' }, status: 400
    end
  end

  private

  def toilet_params
    params.require(:name)
  end

end
