require "test_helper"

class FoodSubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_subtype = food_subtypes(:one)
  end

  test "should get index" do
    get food_subtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_food_subtype_url
    assert_response :success
  end

  test "should create food_subtype" do
    assert_difference("FoodSubtype.count") do
      post food_subtypes_url, params: { food_subtype: { description: @food_subtype.description, food_type_id: @food_subtype.food_type_id, name: @food_subtype.name } }
    end

    assert_redirected_to food_subtype_url(FoodSubtype.last)
  end

  test "should show food_subtype" do
    get food_subtype_url(@food_subtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_subtype_url(@food_subtype)
    assert_response :success
  end

  test "should update food_subtype" do
    patch food_subtype_url(@food_subtype), params: { food_subtype: { description: @food_subtype.description, food_type_id: @food_subtype.food_type_id, name: @food_subtype.name } }
    assert_redirected_to food_subtype_url(@food_subtype)
  end

  test "should destroy food_subtype" do
    assert_difference("FoodSubtype.count", -1) do
      delete food_subtype_url(@food_subtype)
    end

    assert_redirected_to food_subtypes_url
  end
end
