require_relative 'employee'
require_relative '../interfaces/clt'

class Analyst < Employee
  include CLT

  OVERTIME_HOUR_VALUE = 1.0 / 90.0
  MAX_OVERTIME_HOURS = 40

  class InvalidLevelError < StandardError
    def initialize(msg = "Please enter #{LEVELABLE::OCUPATIONS[:junior]} or #{LEVELABLE::OCUPATIONS[:senior]}.")
      super(msg)
    end
  end

  class InvalidOvertimeError < StandardError
    def initialize(msg = 'Please enter a positive number')
      super(msg)
    end
  end

  private_constant :InvalidLevelError, :InvalidOvertimeError

  attr_reader :overtime_hours, :level
  alias bonus_modifier overtime_hours
  alias ocupation level

  def initialize(attrs = {})
    super(id: attrs[:id], name: attrs[:name])

    if attrs.include?(:level)
      raise InvalidLevelError unless
        attrs[:level].upcase == LEVELABLE::OCUPATIONS[:junior] ||
        attrs[:level].upcase == LEVELABLE::OCUPATIONS[:senior]
    end

    attrs.include?(:level) ? set_level(attrs[:level]) : set_level(LEVELABLE::OCUPATIONS[:junior])
    @overtime_hours = attrs.include?(:bonus_modifier) ? attrs[:bonus_modifier] : 0
    base_salary
  end

  def base_salary
    @base_salary = @level == LEVELABLE::OCUPATIONS[:junior] ? PAYABLE::JUNIOR_BASE_SALARY : PAYABLE::SENIOR_BASE_SALARY
  end

  def add_overtime_hours(amount)
    raise InvalidOvertimeError unless amount.is_a?(Numeric) && amount.positive?
    if (@overtime_hours + amount) > MAX_OVERTIME_HOURS
      raise InvalidOvertimeError, "Add #{amount} hours would cause to #{@name} to have more than #{MAX_OVERTIME_HOURS} overtime hours"
    end

    @overtime_hours += amount.ceil
  end

  def to_csv_row
    [@id, @name, @level, @overtime_hours]
  end

  private

  def bonus_modifier_value
    OVERTIME_HOUR_VALUE
  end

  def erase_bonus
    current_bonus = bonus
    @overtime_hours = 0

    current_bonus
  end

  def set_level(level)
    @level = level.upcase == LEVELABLE::OCUPATIONS[:junior] ? LEVELABLE::OCUPATIONS[:junior] : LEVELABLE::OCUPATIONS[:senior]
  end
end
