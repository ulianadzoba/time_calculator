require 'test_helper'
require 'timecop'

class TimeCalculator::Test < ActiveSupport::TestCase
  Timecop.travel(Time.new(2020, 9, 20, 10))

  test "truth" do
    assert_kind_of Module, TimeCalculator
  end

  test 'calculate time left to date after curren date' do
    time_calculator = TimeCalculator::Calculator.new(DateTime.new(2000, 9, 21, 10))

    assert_equal time_calculator.time_to_next_date.days, 0
    assert_equal time_calculator.time_to_next_date.hours, 23
    assert_equal time_calculator.time_to_next_date.minutes, 59
  end

  test 'calculate time left to date before curren date' do
    time_calculator = TimeCalculator::Calculator.new(DateTime.new(2000, 9, 19, 10))

    assert_equal time_calculator.time_to_next_date.days, 363
    assert_equal time_calculator.time_to_next_date.hours, 23
    assert_equal time_calculator.time_to_next_date.minutes, 59
  end

  test 'calculate time left to date for leap year' do
    time_calculator = TimeCalculator::Calculator.new(DateTime.new(2000, 2, 29, 11))

    assert_equal time_calculator.time_to_next_date.days, 1257
    assert_equal time_calculator.time_to_next_date.hours, 0
    assert_equal time_calculator.time_to_next_date.minutes, 59
  end
end
