require "test_helper"

class GladiatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gladiator = gladiators(:one)
  end

  test "should get index" do
    get gladiators_url
    assert_response :success
  end

  test "should get new" do
    get new_gladiator_url
    assert_response :success
  end

  test "should create gladiator" do
    assert_difference('Gladiator.count') do
      post gladiators_url, params: { gladiator: { admin_id: @gladiator.admin_id, info: @gladiator.info, start_date: @gladiator.start_date, title: @gladiator.title } }
    end

    assert_redirected_to gladiator_url(Gladiator.last)
  end

  test "should show gladiator" do
    get gladiator_url(@gladiator)
    assert_response :success
  end

  test "should get edit" do
    get edit_gladiator_url(@gladiator)
    assert_response :success
  end

  test "should update gladiator" do
    patch gladiator_url(@gladiator), params: { gladiator: { admin_id: @gladiator.admin_id, info: @gladiator.info, start_date: @gladiator.start_date, title: @gladiator.title } }
    assert_redirected_to gladiator_url(@gladiator)
  end

  test "should destroy gladiator" do
    assert_difference('Gladiator.count', -1) do
      delete gladiator_url(@gladiator)
    end

    assert_redirected_to gladiators_url
  end
end
