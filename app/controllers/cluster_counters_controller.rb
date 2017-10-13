class ClusterCountersController < ApplicationController
  before_action :set_cluster_counter, only: [:show, :update, :destroy]

  # GET /cluster_counters
  def index
    @cluster_counters = ClusterCounter.all

    render json: @cluster_counters
  end

  # GET /cluster_counters/1
  def show
    render json: @cluster_counter
  end

  # POST /cluster_counters
  def create
    @cluster_counter = ClusterCounter.new(cluster_counter_params)

    if @cluster_counter.save
      render json: @cluster_counter, status: :created, location: @cluster_counter
    else
      render json: @cluster_counter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cluster_counters/1
  def update
    if @cluster_counter.update(cluster_counter_params)
      render json: @cluster_counter
    else
      render json: @cluster_counter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cluster_counters/1
  def destroy
    @cluster_counter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_counter
      @cluster_counter = ClusterCounter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cluster_counter_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
