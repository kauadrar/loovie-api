class SeasonTranslationsController < ApplicationController
  before_action :set_season_translation, only: %i[ show update destroy ]

  # GET /season_translations
  # GET /season_translations.json
  def index
    @season_translations = SeasonTranslation.all
  end

  # GET /season_translations/1
  # GET /season_translations/1.json
  def show
  end

  # POST /season_translations
  # POST /season_translations.json
  def create
    @season_translation = SeasonTranslation.new(season_translation_params)

    if @season_translation.save
      render :show, status: :created, location: @season_translation
    else
      render json: @season_translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /season_translations/1
  # PATCH/PUT /season_translations/1.json
  def update
    if @season_translation.update(season_translation_params)
      render :show, status: :ok, location: @season_translation
    else
      render json: @season_translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /season_translations/1
  # DELETE /season_translations/1.json
  def destroy
    @season_translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season_translation
      @season_translation = SeasonTranslation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def season_translation_params
      params.expect(season_translation: [ :overview ])
    end
end
