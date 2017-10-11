class SensorRecordsController < ApplicationController
  before_action :set_sensor_record, only: [:show, :update, :destroy]

  # GET /sensor_records
  def index
    @sensor_records = SensorRecord.all

    render json: @sensor_records
  end

  # GET /sensor_records/1
  def show
    render json: @sensor_record
  end

  # POST /sensor_records
  def create
    @sensor_record = SensorRecord.new(sensor_record_params)

    if @sensor_record.save
      render json: @sensor_record, status: :created, location: @sensor_record
    else
      render json: @sensor_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sensor_records/1
  def update
    if @sensor_record.update(sensor_record_params)
      render json: @sensor_record
    else
      render json: @sensor_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sensor_records/1
  def destroy
    @sensor_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_record
      @sensor_record = SensorRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sensor_record_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
