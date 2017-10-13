class SensorErrorsController < ApplicationController
  before_action :set_sensor_error, only: [:show, :update, :destroy]

  # GET /sensor_errors
  def index
    @sensor_errors = SensorError.all

    render json: @sensor_errors
  end

  # GET /sensor_errors/1
  def show
    render json: @sensor_error
  end

  # POST /sensor_errors
  def create
    @sensor_error = SensorError.new(sensor_error_params)

    if @sensor_error.save
      render json: @sensor_error, status: :created, location: @sensor_error
    else
      render json: @sensor_error.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sensor_errors/1
  def update
    if @sensor_error.update(sensor_error_params)
      render json: @sensor_error
    else
      render json: @sensor_error.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sensor_errors/1
  def destroy
    @sensor_error.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_error
      @sensor_error = SensorError.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sensor_error_params
      params.require(:sensor_error).permit(:error, :sensor_id)
    end
end
