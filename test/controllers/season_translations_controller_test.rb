require "test_helper"

class SeasonTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @season_translation = season_translations(:one)
  end

  test "should get index" do
    get season_translations_url, as: :json
    assert_response :success
  end

  test "should create season_translation" do
    assert_difference("SeasonTranslation.count") do
      post season_translations_url, params: { season_translation: { overview: @season_translation.overview } }, as: :json
    end

    assert_response :created
  end

  test "should show season_translation" do
    get season_translation_url(@season_translation), as: :json
    assert_response :success
  end

  test "should update season_translation" do
    patch season_translation_url(@season_translation), params: { season_translation: { overview: @season_translation.overview } }, as: :json
    assert_response :success
  end

  test "should destroy season_translation" do
    assert_difference("SeasonTranslation.count", -1) do
      delete season_translation_url(@season_translation), as: :json
    end

    assert_response :no_content
  end
end
