class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show update destroy ]

  # GET /shows
  # GET /shows.json
  def index
    query = params[:query].present? ? params[:query] : "*"
    language_code = request.headers["accept-language"]

    @show_translations = ShowTranslation.search(query, where: { language_code: })

    render "show_translations/index"
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    if @show.save
      render :show, status: :created, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    if @show.update(show_params)
      render :show, status: :ok, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.expect(show: [ :tmbdb_id, :original_name, :original_language, :release_date, :vote_average, :vote_count, :backdrop_path, :popularity, :adult ])
    end
end
