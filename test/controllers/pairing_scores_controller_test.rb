require "test_helper"

class PairingScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pairing_score = pairing_scores(:one)
  end

  test "should get index" do
    get pairing_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_pairing_score_url
    assert_response :success
  end

  test "should create pairing_score" do
    assert_difference("PairingScore.count") do
      post pairing_scores_url, params: { pairing_score: { food_subtype_id: @pairing_score.food_subtype_id, score: @pairing_score.score, wine_type_id: @pairing_score.wine_type_id } }
    end

    assert_redirected_to pairing_score_url(PairingScore.last)
  end

  test "should show pairing_score" do
    get pairing_score_url(@pairing_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_pairing_score_url(@pairing_score)
    assert_response :success
  end

  test "should update pairing_score" do
    patch pairing_score_url(@pairing_score), params: { pairing_score: { food_subtype_id: @pairing_score.food_subtype_id, score: @pairing_score.score, wine_type_id: @pairing_score.wine_type_id } }
    assert_redirected_to pairing_score_url(@pairing_score)
  end

  test "should destroy pairing_score" do
    assert_difference("PairingScore.count", -1) do
      delete pairing_score_url(@pairing_score)
    end

    assert_redirected_to pairing_scores_url
  end
end
