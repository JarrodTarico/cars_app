require 'test_helper'

class PostPartsControllerTest < ActionController::TestCase
  setup do
    @post_part = post_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_part" do
    assert_difference('PostPart.count') do
      post :create, post_part: { body: @post_part.body, external_url: @post_part.external_url, heading: @post_part.heading, neighborhood: @post_part.neighborhood, price: @post_part.price, timestamp: @post_part.timestamp }
    end

    assert_redirected_to post_part_path(assigns(:post_part))
  end

  test "should show post_part" do
    get :show, id: @post_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_part
    assert_response :success
  end

  test "should update post_part" do
    patch :update, id: @post_part, post_part: { body: @post_part.body, external_url: @post_part.external_url, heading: @post_part.heading, neighborhood: @post_part.neighborhood, price: @post_part.price, timestamp: @post_part.timestamp }
    assert_redirected_to post_part_path(assigns(:post_part))
  end

  test "should destroy post_part" do
    assert_difference('PostPart.count', -1) do
      delete :destroy, id: @post_part
    end

    assert_redirected_to post_parts_path
  end
end
