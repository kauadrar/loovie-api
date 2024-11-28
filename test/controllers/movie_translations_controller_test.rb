require "test_helper"

class MovieTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_translation = movie_translations(:one)
  end

  test "should get index" do
    get movie_translations_url, as: :json
    assert_response :success
  end

  test "should create movie_translation" do
    assert_difference("MovieTranslation.count") do
      post movie_translations_url, params: { movie_translation: { language_id: @movie_translation.language_id, movie_id: @movie_translation.movie_id, name: @movie_translation.name, overview: @movie_translation.overview, poster_path: @movie_translation.poster_path } }, as: :json
    end

    assert_response :created
  end

  test "should show movie_translation" do
    get movie_translation_url(@movie_translation), as: :json
    assert_response :success
  end

  test "should update movie_translation" do
    patch movie_translation_url(@movie_translation), params: { movie_translation: { language_id: @movie_translation.language_id, movie_id: @movie_translation.movie_id, name: @movie_translation.name, overview: @movie_translation.overview, poster_path: @movie_translation.poster_path } }, as: :json
    assert_response :success
  end

  test "should destroy movie_translation" do
    assert_difference("MovieTranslation.count", -1) do
      delete movie_translation_url(@movie_translation), as: :json
    end

    assert_response :no_content
  end
end
