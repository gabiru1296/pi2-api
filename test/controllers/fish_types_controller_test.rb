require 'test_helper'

class FishTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fish_type = fish_types(:one)
  end

  test "should get index" do
    get fish_types_url, as: :json
    assert_response :success
  end

  test "should create fish_type" do
    assert_difference('FishType.count') do
      post fish_types_url, params: { fish_type: { name: @fish_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show fish_type" do
    get fish_type_url(@fish_type), as: :json
    assert_response :success
  end

  test "should update fish_type" do
    patch fish_type_url(@fish_type), params: { fish_type: { name: @fish_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy fish_type" do
    assert_difference('FishType.count', -1) do
      delete fish_type_url(@fish_type), as: :json
    end

    assert_response 204
  end
end
