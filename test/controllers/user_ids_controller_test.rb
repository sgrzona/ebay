require 'test_helper'

class UserIdsControllerTest < ActionController::TestCase
  setup do
    @user_id = user_ids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_ids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_id" do
    assert_difference('UserId.count') do
      post :create, user_id: { string: @user_id.string }
    end

    assert_redirected_to user_id_path(assigns(:user_id))
  end

  test "should show user_id" do
    get :show, id: @user_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_id
    assert_response :success
  end

  test "should update user_id" do
    patch :update, id: @user_id, user_id: { string: @user_id.string }
    assert_redirected_to user_id_path(assigns(:user_id))
  end

  test "should destroy user_id" do
    assert_difference('UserId.count', -1) do
      delete :destroy, id: @user_id
    end

    assert_redirected_to user_ids_path
  end
end
