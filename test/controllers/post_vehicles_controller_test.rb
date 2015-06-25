require 'test_helper'

class PostVehiclesControllerTest < ActionController::TestCase
  setup do
    @post_vehicle = post_vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_vehicle" do
    assert_difference('PostVehicle.count') do
      post :create, post_vehicle: { body: @post_vehicle.body, external_url: @post_vehicle.external_url, heading: @post_vehicle.heading, neighborhood: @post_vehicle.neighborhood, price: @post_vehicle.price, timestamp: @post_vehicle.timestamp }
    end

    assert_redirected_to post_vehicle_path(assigns(:post_vehicle))
  end

  test "should show post_vehicle" do
    get :show, id: @post_vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_vehicle
    assert_response :success
  end

  test "should update post_vehicle" do
    patch :update, id: @post_vehicle, post_vehicle: { body: @post_vehicle.body, external_url: @post_vehicle.external_url, heading: @post_vehicle.heading, neighborhood: @post_vehicle.neighborhood, price: @post_vehicle.price, timestamp: @post_vehicle.timestamp }
    assert_redirected_to post_vehicle_path(assigns(:post_vehicle))
  end

  test "should destroy post_vehicle" do
    assert_difference('PostVehicle.count', -1) do
      delete :destroy, id: @post_vehicle
    end

    assert_redirected_to post_vehicles_path
  end
end
