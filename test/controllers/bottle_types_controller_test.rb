require "test_helper"

class BottleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottle_type = bottle_types(:one)
  end

  test "should get index" do
    get bottle_types_url
    assert_response :success
  end

  test "should get new" do
    get new_bottle_type_url
    assert_response :success
  end

  test "should create bottle_type" do
    assert_difference("BottleType.count") do
      post bottle_types_url, params: { bottle_type: { image_url: @bottle_type.image_url, name: @bottle_type.name } }
    end

    assert_redirected_to bottle_type_url(BottleType.last)
  end

  test "should show bottle_type" do
    get bottle_type_url(@bottle_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_bottle_type_url(@bottle_type)
    assert_response :success
  end

  test "should update bottle_type" do
    patch bottle_type_url(@bottle_type), params: { bottle_type: { image_url: @bottle_type.image_url, name: @bottle_type.name } }
    assert_redirected_to bottle_type_url(@bottle_type)
  end

  test "should destroy bottle_type" do
    assert_difference("BottleType.count", -1) do
      delete bottle_type_url(@bottle_type)
    end

    assert_redirected_to bottle_types_url
  end
end
