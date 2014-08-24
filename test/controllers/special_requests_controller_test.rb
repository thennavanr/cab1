require 'test_helper'

class SpecialRequestsControllerTest < ActionController::TestCase
  setup do
    @special_request = special_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_request" do
    assert_difference('SpecialRequest.count') do
      post :create, special_request: { request_type: @special_request.request_type, request_value: @special_request.request_value }
    end

    assert_redirected_to special_request_path(assigns(:special_request))
  end

  test "should show special_request" do
    get :show, id: @special_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @special_request
    assert_response :success
  end

  test "should update special_request" do
    patch :update, id: @special_request, special_request: { request_type: @special_request.request_type, request_value: @special_request.request_value }
    assert_redirected_to special_request_path(assigns(:special_request))
  end

  test "should destroy special_request" do
    assert_difference('SpecialRequest.count', -1) do
      delete :destroy, id: @special_request
    end

    assert_redirected_to special_requests_path
  end
end
