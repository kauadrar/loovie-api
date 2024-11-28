class ShowTranslationsController < ApplicationController
  before_action :set_show_translation, only: %i[ show update destroy ]

  # GET /show_translations
  # GET /show_translations.json
  def index
    @show_translations = ShowTranslation.all
  end

  # GET /show_translations/1
  # GET /show_translations/1.json
  def show
  end

  # POST /show_translations
  # POST /show_translations.json
  def create
    @show_translation = ShowTranslation.new(show_translation_params)

    if @show_translation.save
      render :show, status: :created, location: @show_translation
    else
      render json: @show_translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /show_translations/1
  # PATCH/PUT /show_translations/1.json
  def update
    if @show_translation.update(show_translation_params)
      render :show, status: :ok, location: @show_translation
    else
      render json: @show_translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /show_translations/1
  # DELETE /show_translations/1.json
  def destroy
    @show_translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_translation
      @show_translation = ShowTranslation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def show_translation_params
      params.expect(show_translation: [ :name, :overview, :poster_path, :language_id, :show_id ])
    end
end
