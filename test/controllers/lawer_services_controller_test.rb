require 'test_helper'

class LawerServicesControllerTest < ActionController::TestCase
  setup do
    @lawer_service = lawer_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lawer_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lawer_service" do
    assert_difference('LawerService.count') do
      post :create, lawer_service: { charges: @lawer_service.charges, code: @lawer_service.code, service_code: @lawer_service.service_code, service_name: @lawer_service.service_name }
    end

    assert_redirected_to lawer_service_path(assigns(:lawer_service))
  end

  test "should show lawer_service" do
    get :show, id: @lawer_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lawer_service
    assert_response :success
  end

  test "should update lawer_service" do
    patch :update, id: @lawer_service, lawer_service: { charges: @lawer_service.charges, code: @lawer_service.code, service_code: @lawer_service.service_code, service_name: @lawer_service.service_name }
    assert_redirected_to lawer_service_path(assigns(:lawer_service))
  end

  test "should destroy lawer_service" do
    assert_difference('LawerService.count', -1) do
      delete :destroy, id: @lawer_service
    end

    assert_redirected_to lawer_services_path
  end
end
