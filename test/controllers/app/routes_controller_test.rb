require 'test_helper'

class App::RoutesControllerTest < ActionController::TestCase
  setup do
    @app_route = app_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_route" do
    assert_difference('App::Route.count') do
      post :create, app_route: { name: @app_route.name, user_id: @app_route.user_id }
    end

    assert_redirected_to app_route_path(assigns(:app_route))
  end

  test "should show app_route" do
    get :show, id: @app_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_route
    assert_response :success
  end

  test "should update app_route" do
    patch :update, id: @app_route, app_route: { name: @app_route.name, user_id: @app_route.user_id }
    assert_redirected_to app_route_path(assigns(:app_route))
  end

  test "should destroy app_route" do
    assert_difference('App::Route.count', -1) do
      delete :destroy, id: @app_route
    end

    assert_redirected_to app_routes_path
  end
end
