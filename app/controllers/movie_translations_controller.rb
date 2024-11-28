class MovieTranslationsController < ApplicationController
  before_action :set_movie_translation, only: %i[ show update destroy ]

  # GET /movie_translations
  # GET /movie_translations.json
  def index
    @movie_translations = MovieTranslation.all
  end

  # GET /movie_translations/1
  # GET /movie_translations/1.json
  def show
  end

  # POST /movie_translations
  # POST /movie_translations.json
  def create
    @movie_translation = MovieTranslation.new(movie_translation_params)

    if @movie_translation.save
      render :show, status: :created, location: @movie_translation
    else
      render json: @movie_translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_translations/1
  # PATCH/PUT /movie_translations/1.json
  def update
    if @movie_translation.update(movie_translation_params)
      render :show, status: :ok, location: @movie_translation
    else
      render json: @movie_translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_translations/1
  # DELETE /movie_translations/1.json
  def destroy
    @movie_translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_translation
      @movie_translation = MovieTranslation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_translation_params
      params.expect(movie_translation: [ :name, :overview, :poster_path, :language_id, :movie_id ])
    end
end
