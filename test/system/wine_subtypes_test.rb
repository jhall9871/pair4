require "application_system_test_case"

class WineSubtypesTest < ApplicationSystemTestCase
  setup do
    @wine_subtype = wine_subtypes(:one)
  end

  test "visiting the index" do
    visit wine_subtypes_url
    assert_selector "h1", text: "Wine subtypes"
  end

  test "should create wine subtype" do
    visit wine_subtypes_url
    click_on "New wine subtype"

    fill_in "Description", with: @wine_subtype.description
    fill_in "Name", with: @wine_subtype.name
    fill_in "Wine type", with: @wine_subtype.wine_type_id
    click_on "Create Wine subtype"

    assert_text "Wine subtype was successfully created"
    click_on "Back"
  end

  test "should update Wine subtype" do
    visit wine_subtype_url(@wine_subtype)
    click_on "Edit this wine subtype", match: :first

    fill_in "Description", with: @wine_subtype.description
    fill_in "Name", with: @wine_subtype.name
    fill_in "Wine type", with: @wine_subtype.wine_type_id
    click_on "Update Wine subtype"

    assert_text "Wine subtype was successfully updated"
    click_on "Back"
  end

  test "should destroy Wine subtype" do
    visit wine_subtype_url(@wine_subtype)
    click_on "Destroy this wine subtype", match: :first

    assert_text "Wine subtype was successfully destroyed"
  end
end
