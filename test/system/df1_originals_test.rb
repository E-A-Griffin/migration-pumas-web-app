require "application_system_test_case"

class Df1OriginalsTest < ApplicationSystemTestCase
  setup do
    @df1_original = df1_originals(:one)
  end

  test "visiting the index" do
    visit df1_originals_url
    assert_selector "h1", text: "Df1 originals"
  end

  test "should create df1 original" do
    visit df1_originals_url
    click_on "New df1 original"

    fill_in "Record type", with: @df1_original.record_type
    fill_in "Serial no", with: @df1_original.serial_no
    click_on "Create Df1 original"

    assert_text "Df1 original was successfully created"
    click_on "Back"
  end

  test "should update Df1 original" do
    visit df1_original_url(@df1_original)
    click_on "Edit this df1 original", match: :first

    fill_in "Record type", with: @df1_original.record_type
    fill_in "Serial no", with: @df1_original.serial_no
    click_on "Update Df1 original"

    assert_text "Df1 original was successfully updated"
    click_on "Back"
  end

  test "should destroy Df1 original" do
    visit df1_original_url(@df1_original)
    click_on "Destroy this df1 original", match: :first

    assert_text "Df1 original was successfully destroyed"
  end
end
