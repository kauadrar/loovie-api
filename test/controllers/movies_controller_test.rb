require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { adult: @movie.adult, backdrop_path: @movie.backdrop_path, duration: @movie.duration, original_language: @movie.original_language, original_name: @movie.original_name, popularity: @movie.popularity, release_date: @movie.release_date, tmbdb_id: @movie.tmbdb_id, vote_average: @movie.vote_average, vote_count: @movie.vote_count } }, as: :json
    end

    assert_response :created
  end

  test "should show movie" do
    get movie_url(@movie), as: :json
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { adult: @movie.adult, backdrop_path: @movie.backdrop_path, duration: @movie.duration, original_language: @movie.original_language, original_name: @movie.original_name, popularity: @movie.popularity, release_date: @movie.release_date, tmbdb_id: @movie.tmbdb_id, vote_average: @movie.vote_average, vote_count: @movie.vote_count } }, as: :json
    assert_response :success
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie), as: :json
    end

    assert_response :no_content
  end
end
