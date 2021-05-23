require_relative 'employee'
require_relative '../interfaces/pj'

class Manager < Employee
  include PJ

  PROJECT_VALUE = 0.2
  MAX_SIMULTANEOUS_PROJECTS = 5

  class InvalidProjectAmountError < StandardError
    def initialize(msg = 'Please enter a positive integer')
      super(msg)
    end
  end

  private_constant :InvalidProjectAmountError

  attr_reader :projects_amount, :level
  alias bonus_modifier projects_amount
  alias ocupation level

  def initialize(attrs = {})
    super(id: attrs[:id], name: attrs[:name])

    @projects_amount = attrs.include?(:bonus_modifier) ? attrs[:bonus_modifier] : 0
    @level = LEVELABLE::OCUPATIONS[:manager]
    base_salary
  end

  def base_salary
    @base_salary = PAYABLE::MANAGER_BASE_SALARY
  end

  def add_projects(amount)
    raise InvalidProjectAmountError unless amount.is_a?(Integer) && amount.positive?
    if (@projects_amount + amount) > MAX_SIMULTANEOUS_PROJECTS
      raise InvalidProjectAmountError, "Add #{amount} projects would cause to #{@name} to manage more than #{MAX_SIMULTANEOUS_PROJECTS} projects"
    end

    @projects_amount += amount
  end

  def finish_projects(amount)
    raise InvalidProjectAmountError unless amount.is_a?(Integer) && amount.positive?
    raise InvalidProjectAmountError, "#{@name} isn't currently managing any project" if @projects_amount.zero?
    if @projects_amount == 1 && amount > 1
      raise InvalidProjectAmountError, "#{@name} is currently managing only one project"
    end
    if amount > @projects_amount
      raise InvalidProjectAmountError, "Please enter a number between 1 and #{@projects_amount} (including)"
    end

    @projects_amount -= amount
  end

  def to_csv_row
    [@id, @name, @level, @projects_amount]
  end

  private

  def bonus_modifier_value
    PROJECT_VALUE
  end

  def erase_bonus
    current_bonus = bonus
    @projects_amount = 0

    current_bonus
  end
end
