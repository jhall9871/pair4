require "application_system_test_case"

class PairingScoresTest < ApplicationSystemTestCase
  setup do
    @pairing_score = pairing_scores(:one)
  end

  test "visiting the index" do
    visit pairing_scores_url
    assert_selector "h1", text: "Pairing scores"
  end

  test "should create pairing score" do
    visit pairing_scores_url
    click_on "New pairing score"

    fill_in "Food subtype", with: @pairing_score.food_subtype_id
    fill_in "Score", with: @pairing_score.score
    fill_in "Wine type", with: @pairing_score.wine_type_id
    click_on "Create Pairing score"

    assert_text "Pairing score was successfully created"
    click_on "Back"
  end

  test "should update Pairing score" do
    visit pairing_score_url(@pairing_score)
    click_on "Edit this pairing score", match: :first

    fill_in "Food subtype", with: @pairing_score.food_subtype_id
    fill_in "Score", with: @pairing_score.score
    fill_in "Wine type", with: @pairing_score.wine_type_id
    click_on "Update Pairing score"

    assert_text "Pairing score was successfully updated"
    click_on "Back"
  end

  test "should destroy Pairing score" do
    visit pairing_score_url(@pairing_score)
    click_on "Destroy this pairing score", match: :first

    assert_text "Pairing score was successfully destroyed"
  end
end
