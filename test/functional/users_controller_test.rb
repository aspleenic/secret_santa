require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address2: @user.address2, admin: @user.admin, city: @user.city, email: @user.email, fname: @user.fname, likes: @user.likes, lname: @user.lname, postal_code: @user.postal_code, state_province: @user.state_province, street_address: @user.street_address }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { address2: @user.address2, admin: @user.admin, city: @user.city, email: @user.email, fname: @user.fname, likes: @user.likes, lname: @user.lname, postal_code: @user.postal_code, state_province: @user.state_province, street_address: @user.street_address }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
