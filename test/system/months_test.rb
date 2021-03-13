require "application_system_test_case"

class MonthsTest < ApplicationSystemTestCase
  setup do
    @month = months(:one)
  end

  test "visiting the index" do
    visit months_url
    assert_selector "h1", text: "Months"
  end

  test "creating a Month" do
    visit months_url
    click_on "New Month"

    fill_in "Description", with: @month.description
    fill_in "Start date", with: @month.start_date
    fill_in "Title", with: @month.title
    click_on "Create Month"

    assert_text "Month was successfully created"
    click_on "Back"
  end

  test "updating a Month" do
    visit months_url
    click_on "Edit", match: :first

    fill_in "Description", with: @month.description
    fill_in "Start date", with: @month.start_date
    fill_in "Title", with: @month.title
    click_on "Update Month"

    assert_text "Month was successfully updated"
    click_on "Back"
  end

  test "destroying a Month" do
    visit months_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Month was successfully destroyed"
  end
end
