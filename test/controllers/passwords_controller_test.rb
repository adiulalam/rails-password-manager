require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = passwords(:one)
  end

  test "should get index" do
    get passwords_url
    assert_response :success
  end

  test "should get new" do
    get new_password_url
    assert_response :success
  end

  test "should create password" do
    assert_difference("Password.count") do
      post passwords_url, params: { password: { password: @password.password, url: @password.url, username: @password.username } }
    end

    assert_redirected_to password_url(Password.last)
  end

  test "should show password" do
    get password_url(@password)
    assert_response :success
  end

  test "should get edit" do
    get edit_password_url(@password)
    assert_response :success
  end

  test "should update password" do
    patch password_url(@password), params: { password: { password: @password.password, url: @password.url, username: @password.username } }
    assert_redirected_to password_url(@password)
  end

  test "should destroy password" do
    assert_difference("Password.count", -1) do
      delete password_url(@password)
    end

    assert_redirected_to passwords_url
  end
end
