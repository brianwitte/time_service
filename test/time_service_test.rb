# frozen_string_literal: true

require 'test_helper'

class TimeServiceTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TimeService::VERSION
  end

  def test_instantiates_with_block
    new_time = TimeService::Service.new { ['9:00 PM', 68] }.add_minutes
    assert new_time == '10:08 PM'
  end

  def test_instantiates_without_block
    service = TimeService::Service.new
    assert service.instance_of?(TimeService::Service)
    service.time = '9:00 PM'
    service.minutes_added = 68
    assert service.add_minutes == '10:08 PM'
  end

  def test_time_calculation
    service = TimeService::Service.new
    assert service.instance_of?(TimeService::Service)

    service.time = '9:00 PM'
    service.minutes_added = 10_008
    assert service.add_minutes == '7:48 PM'

    service.time = '7:44 AM'
    service.minutes_added = 511
    assert service.add_minutes == '4:15 PM'

    service.time = '12:13 AM'
    service.minutes_added = 100
    assert service.add_minutes == '1:53 AM'

    service.time = '12:13 AM'
    service.minutes_added = 45_380
    assert service.add_minutes == '12:33 PM'
  end

  def test_raise_argument_error
    assert_raises ArgumentError do
      TimeService::Service.new { [222, 68] }.add_minutes
    end
  end
end
