require 'test_helper'

class ClusterMetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_metric = cluster_metrics(:one)
  end

  test "should get index" do
    get cluster_metrics_url, as: :json
    assert_response :success
  end

  test "should create cluster_metric" do
    assert_difference('ClusterMetric.count') do
      post cluster_metrics_url, params: { cluster_metric: { cluster_id: @cluster_metric.cluster_id, length: @cluster_metric.length, tca: @cluster_metric.tca, weight: @cluster_metric.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show cluster_metric" do
    get cluster_metric_url(@cluster_metric), as: :json
    assert_response :success
  end

  test "should update cluster_metric" do
    patch cluster_metric_url(@cluster_metric), params: { cluster_metric: { cluster_id: @cluster_metric.cluster_id, length: @cluster_metric.length, tca: @cluster_metric.tca, weight: @cluster_metric.weight } }, as: :json
    assert_response 200
  end

  test "should destroy cluster_metric" do
    assert_difference('ClusterMetric.count', -1) do
      delete cluster_metric_url(@cluster_metric), as: :json
    end

    assert_response 204
  end
end
