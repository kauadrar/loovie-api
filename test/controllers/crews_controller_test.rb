require "test_helper"

class CrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crew = crews(:one)
  end

  test "should get index" do
    get crews_url, as: :json
    assert_response :success
  end

  test "should create crew" do
    assert_difference("Crew.count") do
      post crews_url, params: { crew: { production_id: @crew.production_id } }, as: :json
    end

    assert_response :created
  end

  test "should show crew" do
    get crew_url(@crew), as: :json
    assert_response :success
  end

  test "should update crew" do
    patch crew_url(@crew), params: { crew: { production_id: @crew.production_id } }, as: :json
    assert_response :success
  end

  test "should destroy crew" do
    assert_difference("Crew.count", -1) do
      delete crew_url(@crew), as: :json
    end

    assert_response :no_content
  end
end
