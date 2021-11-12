# frozen_string_literal: true

require 'time_service/version'
require 'logger'

module TimeService
  class Error < StandardError; end

  attr_writer :logger

  def self.logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.progname = name
      log.level = Logger.const_get(ENV.fetch('LOG_LEVEL', 'INFO'))
    end
  end

  class Time
    attr_accessor :time, :minutes_added

    NewTime = Struct.new(:hour, :time_minutes, :meridian_indicator) do
      def format
        "#{hour}:#{time_minutes} #{meridian_indicator}"
      end
    end

    def initialize(&block)
      return if block.nil?

      TimeService.logger.info('initialize via block...')
      block_params = block.call
      unless block_params[0].is_a?(String) && block_params[1].is_a?(Integer)
        raise ArgumentError, "expected [String, Integer], got [#{block_params[0].class}, #{block_params[1].class}]"
      end

      @time = block_params[0]
      @minutes_added = block_params[1]
    end
  end

  class Service < Time
    def minutes_format_valid?
      # TODO: write further validations for minutes formatting

      true
    end

    def time_format_valid?
      # TODO: write further validations for time formatting

      true
    end

    def add_minutes
      # TODO: split this beast of a function up
      raise 'time and minutes are not set!' if @time.nil? || @minutes_added.nil?
      raise 'formatting issues with time, minutes!' unless time_format_valid? && minutes_format_valid?

      time_split = @time.split(' ')
      TimeService.logger.info { "calculate #{time_split} plus #{minutes_added} minutes" }

      if time_split.first.include?(':')
        minutes_included_split = time_split.first.split(':')
        hour = minutes_included_split[0].to_i
        time_minutes = minutes_included_split[1].to_i
      else
        hour = time_split.first.to_i
        time_minutes = 0
      end
      meridiem_indicator = time_split.last

      # TODO: (refactor) split section below out -- calculates time as 24 hour clock to reduce AM/PM noise)
      hour += 12 if meridiem_indicator == 'PM'
      hour = 0 if meridiem_indicator == 'AM' && hour == 12
      hours_to_add = @minutes_added / 60
      minutes_to_add = @minutes_added % 60
      time_minutes += minutes_to_add
      if time_minutes >= 60
        time_minutes = time_minutes % 60
        hour += 1
      end
      hour += hours_to_add
      hour = hour % 24 if hour >= 24

      # TODO: (refactor) split section below out -- converts back to 12 hour time
      meridiem_indicator = 'AM' if hour >= 0 && hour <= 11
      meridiem_indicator = 'PM' if hour >= 12 && hour <= 23
      hour -= 12 if meridiem_indicator == 'PM'
      hour = 12 if meridiem_indicator == 'PM' && hour.zero?
      time_minutes = "0#{time_minutes}" if time_minutes < 10

      TimeService.logger.info { 'finished calculating!' }
      new_time = NewTime.new(hour, time_minutes, meridiem_indicator)
      TimeService.logger.info { "the new time is #{new_time.inspect}" }

      # TODO: revisit how this is returned, currently creates struct and formats output there
      new_time.format
    end
  end
end
