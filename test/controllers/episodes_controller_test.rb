require "test_helper"

class EpisodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get episodes_url, as: :json
    assert_response :success
  end

  test "should create episode" do
    assert_difference("Episode.count") do
      post episodes_url, params: { episode: { duration: @episode.duration, number: @episode.number, original_language: @episode.original_language, original_name: @episode.original_name, release_date: @episode.release_date, season_id: @episode.season_id, still_path: @episode.still_path, tmbdb_id: @episode.tmbdb_id, vote_average: @episode.vote_average, vote_count: @episode.vote_count } }, as: :json
    end

    assert_response :created
  end

  test "should show episode" do
    get episode_url(@episode), as: :json
    assert_response :success
  end

  test "should update episode" do
    patch episode_url(@episode), params: { episode: { duration: @episode.duration, number: @episode.number, original_language: @episode.original_language, original_name: @episode.original_name, release_date: @episode.release_date, season_id: @episode.season_id, still_path: @episode.still_path, tmbdb_id: @episode.tmbdb_id, vote_average: @episode.vote_average, vote_count: @episode.vote_count } }, as: :json
    assert_response :success
  end

  test "should destroy episode" do
    assert_difference("Episode.count", -1) do
      delete episode_url(@episode), as: :json
    end

    assert_response :no_content
  end
end
