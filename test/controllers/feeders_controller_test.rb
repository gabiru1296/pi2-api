require 'test_helper'

class FeedersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feeder = feeders(:one)
  end

  test "should get index" do
    get feeders_url, as: :json
    assert_response :success
  end

  test "should create feeder" do
    assert_difference('Feeder.count') do
      post feeders_url, params: { feeder: { nickname: @feeder.nickname, tank_id: @feeder.tank_id } }, as: :json
    end

    assert_response 201
  end

  test "should show feeder" do
    get feeder_url(@feeder), as: :json
    assert_response :success
  end

  test "should update feeder" do
    patch feeder_url(@feeder), params: { feeder: { nickname: @feeder.nickname, tank_id: @feeder.tank_id } }, as: :json
    assert_response 200
  end

  test "should destroy feeder" do
    assert_difference('Feeder.count', -1) do
      delete feeder_url(@feeder), as: :json
    end

    assert_response 204
  end
end
