class ClusterMetricsController < ApplicationController
  before_action :set_cluster_metric, only: [:show, :update, :destroy]

  # GET /cluster_metrics
  def index
    @cluster_metrics = ClusterMetric.all

    render json: @cluster_metrics
  end

  # GET /cluster_metrics/1
  def show
    render json: @cluster_metric
  end

  # POST /cluster_metrics
  def create
    @cluster_metric = ClusterMetric.new(cluster_metric_params)

    if @cluster_metric.save
      render json: @cluster_metric, status: :created, location: @cluster_metric
    else
      render json: @cluster_metric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cluster_metrics/1
  def update
    if @cluster_metric.update(cluster_metric_params)
      render json: @cluster_metric
    else
      render json: @cluster_metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cluster_metrics/1
  def destroy
    @cluster_metric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_metric
      @cluster_metric = ClusterMetric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cluster_metric_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
