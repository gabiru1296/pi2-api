require 'httparty'

class FeedersController < ApplicationController
  before_action :set_feeder, only: [:show, :update, :destroy]

  # GET /feeders
  def index
    @feeders = Feeder.all

    render json: @feeders
  end

  # GET /feeders/1
  def show
    render json: @feeder
  end

  # POST /feeders
  def create
    @feeder = Feeder.new(feeder_params)

    if @feeder.save
      render json: @feeder, status: :created, location: @feeder
    else
      render json: @feeder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeders/1
  def update
    if @feeder.update(feeder_params)
      render json: @feeder
    else
      render json: @feeder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feeders/1
  def destroy
    @feeder.destroy
  end

  def register_data
    data = params['data']

    if data != nil && data.length == 0
      return
    end

    data.each do |register|
      feeder = get_feeder_by_network_code register[:network_code]

      feeder.food_level = params['food_level'].to_i
      feeder.battery_level = params['battery_level'].to_i
      feeder.save

      register_sensor_values(register, feeder)
    end

    render :nothing => true, :status => 200
  end

  def dispatch_data_to_feeder
    api_url = 'http://192.168.15.202:8000'
    @result = HTTParty.post(api_url,
          :body => feeder_working_setups,
          :headers => { 'Content-Type' => 'application/json' } )
    puts @result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeder
      @feeder = Feeder.find(params[:id])
    end

    def get_feeder_by_network_code(network_code)
      return Feeder.find_or_create_by(network_code: network_code)
    end

    def feeder_working_setups
      return { :id => 1,
         :hour => 2,
         :minute => 3,
         :frequency => 4,
         :quanity => 5
      }.to_json
    end

    def register_sensor_values(register, feeder)
      register_value_for_sensor(:ph, register['ph'], feeder)
      register_value_for_sensor(:conductivity, register['conductivity'], feeder)
      register_value_for_sensor(:temperature, register['temperature'], feeder)
    end

    def register_value_for_sensor(type, value, feeder)
      if value == nil
        return
      end

      sensor = feeder.sensors.where(sensor_type: type).take

      if sensor != nil
        SensorRecord.create(value: value.to_f, sensor: sensor)
      else
        new_sensor = sensor_for_type(type, feeder)

        if new_sensor.save
          SensorRecord.create(value: value.to_f, sensor: new_sensor)
        end
      end
    end

    def sensor_for_type(type, feeder)
      case type
      when :ph
        return Sensor.new name: "Sensor PH", description: "Sensor de PH. Descrição default", scale: "cm", sensor_type: :ph, feeder: feeder
      when :conductivity
        return Sensor.new name: "Sensor de Condutividade", description: "Descrição default de condutividade", scale: "cm", sensor_type: :conductivity, feeder: feeder
      when :temperature
        return Sensor.new name: "Sensor de Temperatura", description: "Descrição default de Temperatura", scale: "cm", sensor_type: :temperature, feeder: feeder
      else
        ####### sensor default #######
        return Sensor.new name: "Sensor desconhecido", description: "Descrição default de Temperatura", scale: "cm", sensor_type: :untyped, feeder: feeder
      end
    end

    # Only allow a trusted parameter "white list" through.
    def feeder_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
