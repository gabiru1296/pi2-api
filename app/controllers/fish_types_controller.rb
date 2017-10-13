class FishTypesController < ApplicationController
  before_action :set_fish_type, only: [:show, :update, :destroy]

  # GET /fish_types
  def index
    @fish_types = FishType.all

    render json: @fish_types
  end

  # GET /fish_types/1
  def show
    render json: @fish_type
  end

  # POST /fish_types
  def create
    @fish_type = FishType.new(fish_type_params)

    if @fish_type.save
      render json: @fish_type, status: :created, location: @fish_type
    else
      render json: @fish_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fish_types/1
  def update
    if @fish_type.update(fish_type_params)
      render json: @fish_type
    else
      render json: @fish_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fish_types/1
  def destroy
    @fish_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish_type
      @fish_type = FishType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fish_type_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
