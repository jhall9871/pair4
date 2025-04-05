require "test_helper"

class WineSubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wine_subtype = wine_subtypes(:one)
  end

  test "should get index" do
    get wine_subtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_wine_subtype_url
    assert_response :success
  end

  test "should create wine_subtype" do
    assert_difference("WineSubtype.count") do
      post wine_subtypes_url, params: { wine_subtype: { description: @wine_subtype.description, name: @wine_subtype.name, wine_type_id: @wine_subtype.wine_type_id } }
    end

    assert_redirected_to wine_subtype_url(WineSubtype.last)
  end

  test "should show wine_subtype" do
    get wine_subtype_url(@wine_subtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_wine_subtype_url(@wine_subtype)
    assert_response :success
  end

  test "should update wine_subtype" do
    patch wine_subtype_url(@wine_subtype), params: { wine_subtype: { description: @wine_subtype.description, name: @wine_subtype.name, wine_type_id: @wine_subtype.wine_type_id } }
    assert_redirected_to wine_subtype_url(@wine_subtype)
  end

  test "should destroy wine_subtype" do
    assert_difference("WineSubtype.count", -1) do
      delete wine_subtype_url(@wine_subtype)
    end

    assert_redirected_to wine_subtypes_url
  end
end
