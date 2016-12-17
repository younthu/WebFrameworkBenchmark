class TimeProvidersController < ApplicationController
  before_action :set_time_provider, only: [:show, :update, :destroy]

  # GET /time_providers
  def index
    @time_providers = TimeProvider.all

    render json: @time_providers
  end

  def now
    render json: DateTime.now
  end
  # GET /time_providers/1
  def show
    render json: @time_provider
  end

  # POST /time_providers
  def create
    @time_provider = TimeProvider.new(time_provider_params)

    if @time_provider.save
      render json: @time_provider, status: :created, location: @time_provider
    else
      render json: @time_provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_providers/1
  def update
    if @time_provider.update(time_provider_params)
      render json: @time_provider
    else
      render json: @time_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_providers/1
  def destroy
    @time_provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_provider
      @time_provider = TimeProvider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_provider_params
      params.require(:time_provider).permit(:stamp, :short_string)
    end
end
