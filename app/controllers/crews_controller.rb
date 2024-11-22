class CrewsController < ApplicationController
  before_action :set_crew, only: %i[ show update destroy ]

  # GET /crews
  # GET /crews.json
  def index
    @crews = Crew.all
  end

  # GET /crews/1
  # GET /crews/1.json
  def show
  end

  # POST /crews
  # POST /crews.json
  def create
    @crew = Crew.new(crew_params)

    if @crew.save
      render :show, status: :created, location: @crew
    else
      render json: @crew.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crews/1
  # PATCH/PUT /crews/1.json
  def update
    if @crew.update(crew_params)
      render :show, status: :ok, location: @crew
    else
      render json: @crew.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crews/1
  # DELETE /crews/1.json
  def destroy
    @crew.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew
      @crew = Crew.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def crew_params
      params.expect(crew: [ :production_id ])
    end
end
