class Api::V1::SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show, :update, :destroy]

  def index
    @schedules = Schedule.all
    render json: @schedules
  end

  def show
    render json: @schedule
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      render json: @schedule
    else
      render json: { error: 'Unable to create schedule' }, status: 400
    end
  end

  def update
    if @schedule
      @schedule.update(schedule_params)
      render json: { message: 'Schedule successfuly updated' }, status: 400
    else
      render json: { error: 'Unable to update schedule' }, status: 400
    end
  end

  def destroy
    if @schedule
      @schedule.destroy
      render json: { message: 'Schedule successfuly deleted'}, status: 200
    else
      render json: { error: 'Unable to delete schedule'}, status: 400
    end
  end

  private

  def schedule_params
    params.require([:start, :end, :toilet_id])
  end

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end
end
