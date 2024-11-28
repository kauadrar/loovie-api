require "test_helper"

class ShowTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_translation = show_translations(:one)
  end

  test "should get index" do
    get show_translations_url, as: :json
    assert_response :success
  end

  test "should create show_translation" do
    assert_difference("ShowTranslation.count") do
      post show_translations_url, params: { show_translation: { language_id: @show_translation.language_id, name: @show_translation.name, overview: @show_translation.overview, poster_path: @show_translation.poster_path, show_id: @show_translation.show_id } }, as: :json
    end

    assert_response :created
  end

  test "should show show_translation" do
    get show_translation_url(@show_translation), as: :json
    assert_response :success
  end

  test "should update show_translation" do
    patch show_translation_url(@show_translation), params: { show_translation: { language_id: @show_translation.language_id, name: @show_translation.name, overview: @show_translation.overview, poster_path: @show_translation.poster_path, show_id: @show_translation.show_id } }, as: :json
    assert_response :success
  end

  test "should destroy show_translation" do
    assert_difference("ShowTranslation.count", -1) do
      delete show_translation_url(@show_translation), as: :json
    end

    assert_response :no_content
  end
end
