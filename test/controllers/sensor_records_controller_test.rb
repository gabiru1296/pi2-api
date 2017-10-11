require 'test_helper'

class SensorRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor_record = sensor_records(:one)
  end

  test "should get index" do
    get sensor_records_url, as: :json
    assert_response :success
  end

  test "should create sensor_record" do
    assert_difference('SensorRecord.count') do
      post sensor_records_url, params: { sensor_record: { sensor_id: @sensor_record.sensor_id, value: @sensor_record.value } }, as: :json
    end

    assert_response 201
  end

  test "should show sensor_record" do
    get sensor_record_url(@sensor_record), as: :json
    assert_response :success
  end

  test "should update sensor_record" do
    patch sensor_record_url(@sensor_record), params: { sensor_record: { sensor_id: @sensor_record.sensor_id, value: @sensor_record.value } }, as: :json
    assert_response 200
  end

  test "should destroy sensor_record" do
    assert_difference('SensorRecord.count', -1) do
      delete sensor_record_url(@sensor_record), as: :json
    end

    assert_response 204
  end
end
