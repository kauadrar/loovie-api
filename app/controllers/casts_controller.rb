class CastsController < ApplicationController
  before_action :set_cast, only: %i[ show update destroy ]

  # GET /casts
  # GET /casts.json
  def index
    @casts = Cast.all
  end

  # GET /casts/1
  # GET /casts/1.json
  def show
  end

  # POST /casts
  # POST /casts.json
  def create
    @cast = Cast.new(cast_params)

    if @cast.save
      render :show, status: :created, location: @cast
    else
      render json: @cast.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /casts/1
  # PATCH/PUT /casts/1.json
  def update
    if @cast.update(cast_params)
      render :show, status: :ok, location: @cast
    else
      render json: @cast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /casts/1
  # DELETE /casts/1.json
  def destroy
    @cast.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast
      @cast = Cast.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cast_params
      params.expect(cast: [ :production_id ])
    end
end
