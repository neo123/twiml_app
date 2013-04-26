require 'test_helper'

class CustomerServicesControllerTest < ActionController::TestCase
  setup do
    @customer_service = customer_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_service" do
    assert_difference('CustomerService.count') do
      post :create, customer_service: { customer_id: @customer_service.customer_id, position: @customer_service.position, quantity: @customer_service.quantity, service_id: @customer_service.service_id }
    end

    assert_redirected_to customer_service_path(assigns(:customer_service))
  end

  test "should show customer_service" do
    get :show, id: @customer_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_service
    assert_response :success
  end

  test "should update customer_service" do
    put :update, id: @customer_service, customer_service: { customer_id: @customer_service.customer_id, position: @customer_service.position, quantity: @customer_service.quantity, service_id: @customer_service.service_id }
    assert_redirected_to customer_service_path(assigns(:customer_service))
  end

  test "should destroy customer_service" do
    assert_difference('CustomerService.count', -1) do
      delete :destroy, id: @customer_service
    end

    assert_redirected_to customer_services_path
  end
end
