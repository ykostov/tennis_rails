require "test_helper"

class MesecenToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mesecen_tour = mesecen_tours(:one)
  end

  test "should get index" do
    get mesecen_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_mesecen_tour_url
    assert_response :success
  end

  test "should create mesecen_tour" do
    assert_difference('MesecenTour.count') do
      post mesecen_tours_url, params: { mesecen_tour: { admin_id: @mesecen_tour.admin_id, info: @mesecen_tour.info, start_date: @mesecen_tour.start_date, title: @mesecen_tour.title } }
    end

    assert_redirected_to mesecen_tour_url(MesecenTour.last)
  end

  test "should show mesecen_tour" do
    get mesecen_tour_url(@mesecen_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_mesecen_tour_url(@mesecen_tour)
    assert_response :success
  end

  test "should update mesecen_tour" do
    patch mesecen_tour_url(@mesecen_tour), params: { mesecen_tour: { admin_id: @mesecen_tour.admin_id, info: @mesecen_tour.info, start_date: @mesecen_tour.start_date, title: @mesecen_tour.title } }
    assert_redirected_to mesecen_tour_url(@mesecen_tour)
  end

  test "should destroy mesecen_tour" do
    assert_difference('MesecenTour.count', -1) do
      delete mesecen_tour_url(@mesecen_tour)
    end

    assert_redirected_to mesecen_tours_url
  end
end
