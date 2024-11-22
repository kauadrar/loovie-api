class SubGenresController < ApplicationController
  before_action :set_sub_genre, only: %i[ show update destroy ]

  # GET /sub_genres
  # GET /sub_genres.json
  def index
    @sub_genres = SubGenre.all
  end

  # GET /sub_genres/1
  # GET /sub_genres/1.json
  def show
  end

  # POST /sub_genres
  # POST /sub_genres.json
  def create
    @sub_genre = SubGenre.new(sub_genre_params)

    if @sub_genre.save
      render :show, status: :created, location: @sub_genre
    else
      render json: @sub_genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_genres/1
  # PATCH/PUT /sub_genres/1.json
  def update
    if @sub_genre.update(sub_genre_params)
      render :show, status: :ok, location: @sub_genre
    else
      render json: @sub_genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_genres/1
  # DELETE /sub_genres/1.json
  def destroy
    @sub_genre.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_genre
      @sub_genre = SubGenre.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sub_genre_params
      params.expect(sub_genre: [ :title_id, :title_type ])
    end
end
