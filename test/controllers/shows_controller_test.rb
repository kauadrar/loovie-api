require "test_helper"

class ShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get shows_url, as: :json
    assert_response :success
  end

  test "should create show" do
    assert_difference("Show.count") do
      post shows_url, params: { show: { adult: @show.adult, backdrop_path: @show.backdrop_path, original_language: @show.original_language, original_name: @show.original_name, popularity: @show.popularity, release_date: @show.release_date, tmbdb_id: @show.tmbdb_id, vote_average: @show.vote_average, vote_count: @show.vote_count } }, as: :json
    end

    assert_response :created
  end

  test "should show show" do
    get show_url(@show), as: :json
    assert_response :success
  end

  test "should update show" do
    patch show_url(@show), params: { show: { adult: @show.adult, backdrop_path: @show.backdrop_path, original_language: @show.original_language, original_name: @show.original_name, popularity: @show.popularity, release_date: @show.release_date, tmbdb_id: @show.tmbdb_id, vote_average: @show.vote_average, vote_count: @show.vote_count } }, as: :json
    assert_response :success
  end

  test "should destroy show" do
    assert_difference("Show.count", -1) do
      delete show_url(@show), as: :json
    end

    assert_response :no_content
  end
end
