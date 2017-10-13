class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :update, :destroy, :register_transation]

  # GET /tanks
  def index
    @tanks = Tank.all

    render json: @tanks
  end

  # GET /tanks/1
  def show
    render json: @tank
  end

  # POST /tanks
  def create
    @tank = Tank.new(tank_params)

    if @tank.save
      render json: @tank, status: :created, location: @tank
    else
      render json: @tank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tanks/1
  def update
    if @tank.update(tank_params)
      render json: @tank
    else
      render json: @tank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tanks/1
  def destroy
    @tank.destroy
  end

  def register_transation
    code = params[:code]
    quantity = params[:quantity]

    cluster = @tank.current_cluster
    counterType = ClusterCounterType.where(code: code).take

    if ClusterCounter.create(quantity: quantity, cluster_counter_type: counterType, cluster: cluster)
      render json: {
        success: true
      }
    else
      render json: {
        success: false
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tank_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
