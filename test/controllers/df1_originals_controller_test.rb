require "test_helper"

class Df1OriginalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @df1_original = df1_originals(:one)
  end

  test "should get index" do
    get df1_originals_url
    assert_response :success
  end

  test "should get new" do
    get new_df1_original_url
    assert_response :success
  end

  test "should create df1_original" do
    assert_difference("Df1Original.count") do
      post df1_originals_url, params: { df1_original: { record_type: @df1_original.record_type, serial_no: @df1_original.serial_no } }
    end

    assert_redirected_to df1_original_url(Df1Original.last)
  end

  test "should show df1_original" do
    get df1_original_url(@df1_original)
    assert_response :success
  end

  test "should get edit" do
    get edit_df1_original_url(@df1_original)
    assert_response :success
  end

  test "should update df1_original" do
    patch df1_original_url(@df1_original), params: { df1_original: { record_type: @df1_original.record_type, serial_no: @df1_original.serial_no } }
    assert_redirected_to df1_original_url(@df1_original)
  end

  test "should destroy df1_original" do
    assert_difference("Df1Original.count", -1) do
      delete df1_original_url(@df1_original)
    end

    assert_redirected_to df1_originals_url
  end
end
