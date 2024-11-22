class ProductionTranslationsController < ApplicationController
  before_action :set_production_translation, only: %i[ show update destroy ]

  # GET /production_translations
  # GET /production_translations.json
  def index
    @production_translations = ProductionTranslation.all
  end

  # GET /production_translations/1
  # GET /production_translations/1.json
  def show
  end

  # POST /production_translations
  # POST /production_translations.json
  def create
    @production_translation = ProductionTranslation.new(production_translation_params)

    if @production_translation.save
      render :show, status: :created, location: @production_translation
    else
      render json: @production_translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /production_translations/1
  # PATCH/PUT /production_translations/1.json
  def update
    if @production_translation.update(production_translation_params)
      render :show, status: :ok, location: @production_translation
    else
      render json: @production_translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /production_translations/1
  # DELETE /production_translations/1.json
  def destroy
    @production_translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_translation
      @production_translation = ProductionTranslation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def production_translation_params
      params.expect(production_translation: [ :name, :overview, :poster_path, :language_id, :production_id, :production_type ])
    end
end
