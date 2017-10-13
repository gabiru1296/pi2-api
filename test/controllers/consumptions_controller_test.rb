require 'test_helper'

class ConsumptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumption = consumptions(:one)
  end

  test "should get index" do
    get consumptions_url, as: :json
    assert_response :success
  end

  test "should create consumption" do
    assert_difference('Consumption.count') do
      post consumptions_url, params: { consumption: { feeder_id: @consumption.feeder_id, lot_id: @consumption.lot_id, quantity: @consumption.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show consumption" do
    get consumption_url(@consumption), as: :json
    assert_response :success
  end

  test "should update consumption" do
    patch consumption_url(@consumption), params: { consumption: { feeder_id: @consumption.feeder_id, lot_id: @consumption.lot_id, quantity: @consumption.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy consumption" do
    assert_difference('Consumption.count', -1) do
      delete consumption_url(@consumption), as: :json
    end

    assert_response 204
  end
end
