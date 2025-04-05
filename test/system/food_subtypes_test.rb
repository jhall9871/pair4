require "application_system_test_case"

class FoodSubtypesTest < ApplicationSystemTestCase
  setup do
    @food_subtype = food_subtypes(:one)
  end

  test "visiting the index" do
    visit food_subtypes_url
    assert_selector "h1", text: "Food subtypes"
  end

  test "should create food subtype" do
    visit food_subtypes_url
    click_on "New food subtype"

    fill_in "Description", with: @food_subtype.description
    fill_in "Food type", with: @food_subtype.food_type_id
    fill_in "Name", with: @food_subtype.name
    click_on "Create Food subtype"

    assert_text "Food subtype was successfully created"
    click_on "Back"
  end

  test "should update Food subtype" do
    visit food_subtype_url(@food_subtype)
    click_on "Edit this food subtype", match: :first

    fill_in "Description", with: @food_subtype.description
    fill_in "Food type", with: @food_subtype.food_type_id
    fill_in "Name", with: @food_subtype.name
    click_on "Update Food subtype"

    assert_text "Food subtype was successfully updated"
    click_on "Back"
  end

  test "should destroy Food subtype" do
    visit food_subtype_url(@food_subtype)
    click_on "Destroy this food subtype", match: :first

    assert_text "Food subtype was successfully destroyed"
  end
end
