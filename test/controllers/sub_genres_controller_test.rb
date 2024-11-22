require "test_helper"

class SubGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_genre = sub_genres(:one)
  end

  test "should get index" do
    get sub_genres_url, as: :json
    assert_response :success
  end

  test "should create sub_genre" do
    assert_difference("SubGenre.count") do
      post sub_genres_url, params: { sub_genre: { title_id: @sub_genre.title_id, title_type: @sub_genre.title_type } }, as: :json
    end

    assert_response :created
  end

  test "should show sub_genre" do
    get sub_genre_url(@sub_genre), as: :json
    assert_response :success
  end

  test "should update sub_genre" do
    patch sub_genre_url(@sub_genre), params: { sub_genre: { title_id: @sub_genre.title_id, title_type: @sub_genre.title_type } }, as: :json
    assert_response :success
  end

  test "should destroy sub_genre" do
    assert_difference("SubGenre.count", -1) do
      delete sub_genre_url(@sub_genre), as: :json
    end

    assert_response :no_content
  end
end
