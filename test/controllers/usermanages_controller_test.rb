require 'test_helper'

class UsermanagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usermanage = usermanages(:one)
  end

  test "should get index" do
    get usermanages_url
    assert_response :success
  end

  test "should get new" do
    get new_usermanage_url
    assert_response :success
  end

  test "should create usermanage" do
    assert_difference('Usermanage.count') do
      post usermanages_url, params: { usermanage: { email: @usermanage.email, name: @usermanage.name } }
    end

    assert_redirected_to usermanage_url(Usermanage.last)
  end

  test "should show usermanage" do
    get usermanage_url(@usermanage)
    assert_response :success
  end

  test "should get edit" do
    get edit_usermanage_url(@usermanage)
    assert_response :success
  end

  test "should update usermanage" do
    patch usermanage_url(@usermanage), params: { usermanage: { email: @usermanage.email, name: @usermanage.name } }
    assert_redirected_to usermanage_url(@usermanage)
  end

  test "should destroy usermanage" do
    assert_difference('Usermanage.count', -1) do
      delete usermanage_url(@usermanage)
    end

    assert_redirected_to usermanages_url
  end
end
