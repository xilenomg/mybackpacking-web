require 'test_helper'

class Admin::CheckinsControllerTest < ActionController::TestCase
  setup do
    @admin_checkin = admin_checkins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_checkins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_checkin" do
    assert_difference('Admin::Checkin.count') do
      post :create, admin_checkin: { place: @admin_checkin.place, user: @admin_checkin.user }
    end

    assert_redirected_to admin_checkin_path(assigns(:admin_checkin))
  end

  test "should show admin_checkin" do
    get :show, id: @admin_checkin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_checkin
    assert_response :success
  end

  test "should update admin_checkin" do
    patch :update, id: @admin_checkin, admin_checkin: { place: @admin_checkin.place, user: @admin_checkin.user }
    assert_redirected_to admin_checkin_path(assigns(:admin_checkin))
  end

  test "should destroy admin_checkin" do
    assert_difference('Admin::Checkin.count', -1) do
      delete :destroy, id: @admin_checkin
    end

    assert_redirected_to admin_checkins_path
  end
end
