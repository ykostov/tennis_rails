require "application_system_test_case"

class MesecenToursTest < ApplicationSystemTestCase
  setup do
    @mesecen_tour = mesecen_tours(:one)
  end

  test "visiting the index" do
    visit mesecen_tours_url
    assert_selector "h1", text: "Mesecen Tours"
  end

  test "creating a Mesecen tour" do
    visit mesecen_tours_url
    click_on "New Mesecen Tour"

    fill_in "Admin", with: @mesecen_tour.admin_id
    fill_in "Info", with: @mesecen_tour.info
    fill_in "Start date", with: @mesecen_tour.start_date
    fill_in "Title", with: @mesecen_tour.title
    click_on "Create Mesecen tour"

    assert_text "Mesecen tour was successfully created"
    click_on "Back"
  end

  test "updating a Mesecen tour" do
    visit mesecen_tours_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @mesecen_tour.admin_id
    fill_in "Info", with: @mesecen_tour.info
    fill_in "Start date", with: @mesecen_tour.start_date
    fill_in "Title", with: @mesecen_tour.title
    click_on "Update Mesecen tour"

    assert_text "Mesecen tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Mesecen tour" do
    visit mesecen_tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mesecen tour was successfully destroyed"
  end
end
