require "application_system_test_case"

class BottleTypesTest < ApplicationSystemTestCase
  setup do
    @bottle_type = bottle_types(:one)
  end

  test "visiting the index" do
    visit bottle_types_url
    assert_selector "h1", text: "Bottle types"
  end

  test "should create bottle type" do
    visit bottle_types_url
    click_on "New bottle type"

    fill_in "Image url", with: @bottle_type.image_url
    fill_in "Name", with: @bottle_type.name
    click_on "Create Bottle type"

    assert_text "Bottle type was successfully created"
    click_on "Back"
  end

  test "should update Bottle type" do
    visit bottle_type_url(@bottle_type)
    click_on "Edit this bottle type", match: :first

    fill_in "Image url", with: @bottle_type.image_url
    fill_in "Name", with: @bottle_type.name
    click_on "Update Bottle type"

    assert_text "Bottle type was successfully updated"
    click_on "Back"
  end

  test "should destroy Bottle type" do
    visit bottle_type_url(@bottle_type)
    click_on "Destroy this bottle type", match: :first

    assert_text "Bottle type was successfully destroyed"
  end
end
