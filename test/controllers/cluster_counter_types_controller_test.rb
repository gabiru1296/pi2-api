require 'test_helper'

class ClusterCounterTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_counter_type = cluster_counter_types(:one)
  end

  test "should get index" do
    get cluster_counter_types_url, as: :json
    assert_response :success
  end

  test "should create cluster_counter_type" do
    assert_difference('ClusterCounterType.count') do
      post cluster_counter_types_url, params: { cluster_counter_type: { code: @cluster_counter_type.code, description: @cluster_counter_type.description } }, as: :json
    end

    assert_response 201
  end

  test "should show cluster_counter_type" do
    get cluster_counter_type_url(@cluster_counter_type), as: :json
    assert_response :success
  end

  test "should update cluster_counter_type" do
    patch cluster_counter_type_url(@cluster_counter_type), params: { cluster_counter_type: { code: @cluster_counter_type.code, description: @cluster_counter_type.description } }, as: :json
    assert_response 200
  end

  test "should destroy cluster_counter_type" do
    assert_difference('ClusterCounterType.count', -1) do
      delete cluster_counter_type_url(@cluster_counter_type), as: :json
    end

    assert_response 204
  end
end
