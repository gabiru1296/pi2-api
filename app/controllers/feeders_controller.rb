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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeder
      @feeder = Feeder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feeder_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
