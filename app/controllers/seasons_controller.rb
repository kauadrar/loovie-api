class SeasonsController < ApplicationController
  before_action :set_season, only: %i[ show update destroy ]

  # GET /seasons
  # GET /seasons.json
  def index
    @seasons = Season.all
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
  end

  # POST /seasons
  # POST /seasons.json
  def create
    @season = Season.new(season_params)

    if @season.save
      render :show, status: :created, location: @season
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seasons/1
  # PATCH/PUT /seasons/1.json
  def update
    if @season.update(season_params)
      render :show, status: :ok, location: @season
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.expect(season: [ :number, :poster_path, :backdrop_path, :show_id ])
    end
end
