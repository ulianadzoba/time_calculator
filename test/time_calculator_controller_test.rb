require 'test_helper'

class TimeCalculatorControllerTest < ActionDispatch::IntegrationTest
  test "show time selection form" do
    get '/time_calculator/calculator'
    assert_response :success
  end

  test "calculate time left to selected date" do
    post '/time_calculator/calculator', params: { calculator: { date: "2020-12-31 12:00" } }
    assert_response :success
  end
end