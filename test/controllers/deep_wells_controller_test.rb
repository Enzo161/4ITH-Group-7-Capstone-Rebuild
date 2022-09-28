require 'test_helper'

class DeepWellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deep_well = deep_wells(:one)
  end

  test "should get index" do
    get deep_wells_url
    assert_response :success
  end

  test "should get new" do
    get new_deep_well_url
    assert_response :success
  end

  test "should create deep_well" do
    assert_difference('DeepWell.count') do
      post deep_wells_url, params: { deep_well: { client_id: @deep_well.client_id, name: @deep_well.name } }
    end

    assert_redirected_to deep_well_url(DeepWell.last)
  end

  test "should show deep_well" do
    get deep_well_url(@deep_well)
    assert_response :success
  end

  test "should get edit" do
    get edit_deep_well_url(@deep_well)
    assert_response :success
  end

  test "should update deep_well" do
    patch deep_well_url(@deep_well), params: { deep_well: { client_id: @deep_well.client_id, name: @deep_well.name } }
    assert_redirected_to deep_well_url(@deep_well)
  end

  test "should destroy deep_well" do
    assert_difference('DeepWell.count', -1) do
      delete deep_well_url(@deep_well)
    end

    assert_redirected_to deep_wells_url
  end
end
