require "test_helper"

class WineTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine_type = wine_types(:one)
  end

  test "should get index" do
    get wine_types_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_type_url
    assert_response :success
  end

  test "should create wine_type" do
    assert_difference("WineType.count") do
      post wine_types_url, params: { wine_type: { description: @wine_type.description, image_url: @wine_type.image_url, name: @wine_type.name } }
    end

    assert_redirected_to wine_type_url(WineType.last)
  end

  test "should show wine_type" do
    get wine_type_url(@wine_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_type_url(@wine_type)
    assert_response :success
  end

  test "should update wine_type" do
    patch wine_type_url(@wine_type), params: { wine_type: { description: @wine_type.description, image_url: @wine_type.image_url, name: @wine_type.name } }
    assert_redirected_to wine_type_url(@wine_type)
  end

  test "should destroy wine_type" do
    assert_difference("WineType.count", -1) do
      delete wine_type_url(@wine_type)
    end

    assert_redirected_to wine_types_url
  end
end
