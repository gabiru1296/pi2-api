require 'test_helper'

class LotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lot = lots(:one)
  end

  test "should get index" do
    get lots_url, as: :json
    assert_response :success
  end

  test "should create lot" do
    assert_difference('Lot.count') do
      post lots_url, params: { lot: { buy_date: @lot.buy_date, current_quantity: @lot.current_quantity, end_date: @lot.end_date, food: @lot.food, price: @lot.price, quantity: @lot.quantity, validity: @lot.validity } }, as: :json
    end

    assert_response 201
  end

  test "should show lot" do
    get lot_url(@lot), as: :json
    assert_response :success
  end

  test "should update lot" do
    patch lot_url(@lot), params: { lot: { buy_date: @lot.buy_date, current_quantity: @lot.current_quantity, end_date: @lot.end_date, food: @lot.food, price: @lot.price, quantity: @lot.quantity, validity: @lot.validity } }, as: :json
    assert_response 200
  end

  test "should destroy lot" do
    assert_difference('Lot.count', -1) do
      delete lot_url(@lot), as: :json
    end

    assert_response 204
  end
end
