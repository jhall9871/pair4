require "application_system_test_case"

class WineTypesTest < ApplicationSystemTestCase
  setup do
    @wine_type = wine_types(:one)
  end

  test "visiting the index" do
    visit wine_types_url
    assert_selector "h1", text: "Wine types"
  end

  test "should create wine type" do
    visit wine_types_url
    click_on "New wine type"

    fill_in "Description", with: @wine_type.description
    fill_in "Image url", with: @wine_type.image_url
    fill_in "Name", with: @wine_type.name
    click_on "Create Wine type"

    assert_text "Wine type was successfully created"
    click_on "Back"
  end

  test "should update Wine type" do
    visit wine_type_url(@wine_type)
    click_on "Edit this wine type", match: :first

    fill_in "Description", with: @wine_type.description
    fill_in "Image url", with: @wine_type.image_url
    fill_in "Name", with: @wine_type.name
    click_on "Update Wine type"

    assert_text "Wine type was successfully updated"
    click_on "Back"
  end

  test "should destroy Wine type" do
    visit wine_type_url(@wine_type)
    click_on "Destroy this wine type", match: :first

    assert_text "Wine type was successfully destroyed"
  end
end
