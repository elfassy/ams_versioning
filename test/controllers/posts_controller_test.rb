require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  def json_response
    JSON.parse(response.body)
  end

  # Test API V1
  def assert_v1
    json = json_response.is_a?(Array) ? json_response.first : json_response
    assert_includes json.keys, "id"
  end

  test "V1 should get index" do
    get :index, {format: :json}
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_v1
  end
  test "V1 should get new" do
    get :new
    assert_response :success
    assert_v1
  end
  test "V1 should create post" do
    assert_difference('Post.count') do
      post :create, post: { name: @post.name }
    end
    assert_response :success
    assert_v1
  end

  test "V1 should show post" do
    get :show, id: @post, api_version: 1
    assert_response :success
    assert_equal 1, json_response.size
    assert_v1
  end

  test "V1 should get edit" do
    get :edit, id: @post
    assert_response :success
    assert_v1
  end

  test "V1 should update post" do
    patch :update, id: @post, post: { name: @post.name }
    assert_response :success
    assert_v1
  end

  test "V1 should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_response :success
  end



  # Test API V2
  def assert_v2
    json = json_response.is_a?(Array) ? json_response.first : json_response
    assert_includes json.keys, "name"
    assert_includes json.keys, "comments"
  end

  test "V2 should get index" do
    get :index, api_version: 2
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_v2
  end
  test "V2 should get new" do
    get :new, api_version: 2
    assert_response :success
    assert_v2
  end
  test "V2 should create post" do
    assert_difference('Post.count') do
      post :create, post: { name: @post.name }, api_version: 2
    end
    assert_response :success
    assert_v2
  end

  test "V2 should show post" do
    get :show, id: @post, api_version: 2
    assert_response :success
    assert_v2
  end

  test "V2 should get edit" do
    get :edit, id: @post, api_version: 2
    assert_response :success
    assert_v2
  end

  test "V2 should update post" do
    patch :update, id: @post, post: { name: @post.name }, api_version: 2
    assert_response :success
    assert_v2
  end

end
