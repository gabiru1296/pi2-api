require 'test_helper'

class SensorErrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_error = sensor_errors(:one)
  end

  test "should get index" do
    get sensor_errors_url, as: :json
    assert_response :success
  end

  test "should create sensor_error" do
    assert_difference('SensorError.count') do
      post sensor_errors_url, params: { sensor_error: { error: @sensor_error.error, sensor_id: @sensor_error.sensor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show sensor_error" do
    get sensor_error_url(@sensor_error), as: :json
    assert_response :success
  end

  test "should update sensor_error" do
    patch sensor_error_url(@sensor_error), params: { sensor_error: { error: @sensor_error.error, sensor_id: @sensor_error.sensor_id } }, as: :json
    assert_response 200
  end

  test "should destroy sensor_error" do
    assert_difference('SensorError.count', -1) do
      delete sensor_error_url(@sensor_error), as: :json
    end

    assert_response 204
  end
end
