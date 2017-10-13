require 'test_helper'

class ClusterCountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_counter = cluster_counters(:one)
  end

  test "should get index" do
    get cluster_counters_url, as: :json
    assert_response :success
  end

  test "should create cluster_counter" do
    assert_difference('ClusterCounter.count') do
      post cluster_counters_url, params: { cluster_counter: { cluster_counter_type_id: @cluster_counter.cluster_counter_type_id, cluster_id: @cluster_counter.cluster_id, quantity: @cluster_counter.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show cluster_counter" do
    get cluster_counter_url(@cluster_counter), as: :json
    assert_response :success
  end

  test "should update cluster_counter" do
    patch cluster_counter_url(@cluster_counter), params: { cluster_counter: { cluster_counter_type_id: @cluster_counter.cluster_counter_type_id, cluster_id: @cluster_counter.cluster_id, quantity: @cluster_counter.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy cluster_counter" do
    assert_difference('ClusterCounter.count', -1) do
      delete cluster_counter_url(@cluster_counter), as: :json
    end

    assert_response 204
  end
end
