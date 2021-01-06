require "application_system_test_case"

class GladiatorsTest < ApplicationSystemTestCase
  setup do
    @gladiator = gladiators(:one)
  end

  test "visiting the index" do
    visit gladiators_url
    assert_selector "h1", text: "Gladiators"
  end

  test "creating a Gladiator" do
    visit gladiators_url
    click_on "New Gladiator"

    fill_in "Admin", with: @gladiator.admin_id
    fill_in "Info", with: @gladiator.info
    fill_in "Start date", with: @gladiator.start_date
    fill_in "Title", with: @gladiator.title
    click_on "Create Gladiator"

    assert_text "Gladiator was successfully created"
    click_on "Back"
  end

  test "updating a Gladiator" do
    visit gladiators_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @gladiator.admin_id
    fill_in "Info", with: @gladiator.info
    fill_in "Start date", with: @gladiator.start_date
    fill_in "Title", with: @gladiator.title
    click_on "Update Gladiator"

    assert_text "Gladiator was successfully updated"
    click_on "Back"
  end

  test "destroying a Gladiator" do
    visit gladiators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gladiator was successfully destroyed"
  end
end
