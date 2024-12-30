class NormalPostsController < ApplicationController
  before_action :set_normal_post, only: %i[ show update destroy ]

  # GET /normal_posts
  # GET /normal_posts.json
  def index
    @normal_posts = NormalPost.all
  end

  # GET /normal_posts/1
  # GET /normal_posts/1.json
  def show
  end

  # POST /normal_posts
  # POST /normal_posts.json
  def create
    @normal_post = NormalPost.new(normal_post_params)

    if @normal_post.save
      render :show, status: :created, location: @normal_post
    else
      render json: @normal_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /normal_posts/1
  # PATCH/PUT /normal_posts/1.json
  def update
    if @normal_post.update(normal_post_params)
      render :show, status: :ok, location: @normal_post
    else
      render json: @normal_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /normal_posts/1
  # DELETE /normal_posts/1.json
  def destroy
    @normal_post.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_post
      @normal_post = NormalPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def normal_post_params
      params.expect(normal_post: [ :post_id, :text ])
    end
end
