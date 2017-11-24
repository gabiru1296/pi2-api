require 'httparty'

class FeedersController < ApplicationController
  before_action :set_feeder, only: [:show, :update, :destroy, :dispatch_data_to_feeder]

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
      render :nothing => true, :status => 412
      return
    end

    data.each do |register|
      feeder = get_feeder_by_network_code register[:network_code]

      feeder.food_level = register['food_level'].to_i
      feeder.battery_level = register['battery_level'].to_i
      feeder.save

      register_sensor_values(register, feeder)
    end

    render :nothing => true, :status => 200
  end

  def dispatch_data_to_feeder
    api_url = Rails.application.config.base_module_ip
    @result = HTTParty.post(api_url,
          :body => feeder_working_setups,
          :headers => { 'Content-Type' => 'application/json' } )

    render :nothing => true, :status => @result.code
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
      t = Time.now
      hour = t.hour
      minute = t.min + 1
      return { :id => @feeder.network_code,
        data: [
          {
            :hour => hour,
            :minute => minute,
            :quantity => 5
          },
          {
            :hour => hour,
            :minute => minute + 1,
            :quantity => 5
          },
          {
            :hour => hour,
            :minute => minute + 2,
            :quantity => 5
          },
          {
            :hour => hour,
            :minute => minute + 3,
            :quantity => 5
          },
          {
            :hour => hour,
            :minute => minute + 4,
            :quantity => 5
          },
          {
            :hour => hour,
            :minute => minute + 5,
            :quantity => 5
          }
        ]
      }.to_json
    end

    def register_sensor_values(register, feeder)
      now = DateTime.new
      normilizedData =  now.change({hour: register["hora"].to_i, min: register["minute"].to_i, sec: 0})
      puts "-------------------------"
      puts register
      puts "-------------------------"
      register_value_for_sensor(:ph, register['ph'], feeder, normilizedData)
      register_value_for_sensor(:conductivity, register['conductivity'], feeder, normilizedData)
      register_value_for_sensor(:temperature, register['temperature'], feeder, normilizedData)
      register_value_for_sensor(:turbidity, register['turbidity'], feeder, normilizedData)
      register_value_for_sensor(:oxigenium, register['oxigenium'], feeder, normilizedData)
    end

    def register_value_for_sensor(type, value, feeder, datetime)
      if value == nil
        return
      end

      sensor = feeder.sensors.where(sensor_type: type).take

      if sensor != nil
        SensorRecord.create(value: value.to_f, sensor: sensor, created_at: datetime)
      else
        new_sensor = sensor_for_type(type, feeder)

        if new_sensor.save
          SensorRecord.create(value: value.to_f, sensor: new_sensor, created_at: datetime)
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
      when :oxigenium
        return Sensor.new name: "Sensor de Oxigênio", description: "Descrição default de Oxigêncio", scale: "cm", sensor_type: :oxigenium, feeder: feeder
      when :turbidity
        return Sensor.new name: "Sensor de Turbidez", description: "Descrição default de Tubidez", scale: "cm", sensor_type: :turbidity, feeder: feeder
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
