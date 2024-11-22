require "test_helper"

class ProductionTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_translation = production_translations(:one)
  end

  test "should get index" do
    get production_translations_url, as: :json
    assert_response :success
  end

  test "should create production_translation" do
    assert_difference("ProductionTranslation.count") do
      post production_translations_url, params: { production_translation: { language_id: @production_translation.language_id, name: @production_translation.name, overview: @production_translation.overview, poster_path: @production_translation.poster_path, production_id: @production_translation.production_id, production_type: @production_translation.production_type } }, as: :json
    end

    assert_response :created
  end

  test "should show production_translation" do
    get production_translation_url(@production_translation), as: :json
    assert_response :success
  end

  test "should update production_translation" do
    patch production_translation_url(@production_translation), params: { production_translation: { language_id: @production_translation.language_id, name: @production_translation.name, overview: @production_translation.overview, poster_path: @production_translation.poster_path, production_id: @production_translation.production_id, production_type: @production_translation.production_type } }, as: :json
    assert_response :success
  end

  test "should destroy production_translation" do
    assert_difference("ProductionTranslation.count", -1) do
      delete production_translation_url(@production_translation), as: :json
    end

    assert_response :no_content
  end
end
