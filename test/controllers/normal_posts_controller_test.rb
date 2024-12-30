require "test_helper"

class NormalPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_post = normal_posts(:one)
  end

  test "should get index" do
    get normal_posts_url, as: :json
    assert_response :success
  end

  test "should create normal_post" do
    assert_difference("NormalPost.count") do
      post normal_posts_url, params: { normal_post: { post_id: @normal_post.post_id, text: @normal_post.text } }, as: :json
    end

    assert_response :created
  end

  test "should show normal_post" do
    get normal_post_url(@normal_post), as: :json
    assert_response :success
  end

  test "should update normal_post" do
    patch normal_post_url(@normal_post), params: { normal_post: { post_id: @normal_post.post_id, text: @normal_post.text } }, as: :json
    assert_response :success
  end

  test "should destroy normal_post" do
    assert_difference("NormalPost.count", -1) do
      delete normal_post_url(@normal_post), as: :json
    end

    assert_response :no_content
  end
end
