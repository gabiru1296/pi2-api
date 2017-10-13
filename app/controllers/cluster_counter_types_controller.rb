class ClusterCounterTypesController < ApplicationController
  before_action :set_cluster_counter_type, only: [:show, :update, :destroy]

  # GET /cluster_counter_types
  def index
    @cluster_counter_types = ClusterCounterType.all

    render json: @cluster_counter_types
  end

  # GET /cluster_counter_types/1
  def show
    render json: @cluster_counter_type
  end

  # POST /cluster_counter_types
  def create
    @cluster_counter_type = ClusterCounterType.new(cluster_counter_type_params)

    if @cluster_counter_type.save
      render json: @cluster_counter_type, status: :created, location: @cluster_counter_type
    else
      render json: @cluster_counter_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cluster_counter_types/1
  def update
    if @cluster_counter_type.update(cluster_counter_type_params)
      render json: @cluster_counter_type
    else
      render json: @cluster_counter_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cluster_counter_types/1
  def destroy
    @cluster_counter_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_counter_type
      @cluster_counter_type = ClusterCounterType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cluster_counter_type_params
      params.require(:cluster_counter_type).permit(:code, :description)
    end
end
