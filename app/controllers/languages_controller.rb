class LanguagesController < ApplicationController
  before_action :set_language, only: %i[ show update destroy ]

  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(language_params)

    if @language.save
      render :show, status: :created, location: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update
    if @language.update(language_params)
      render :show, status: :ok, location: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def language_params
      params.expect(language: [ :code, :name ])
    end
end
