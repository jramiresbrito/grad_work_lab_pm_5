require_relative '../models/analyst.rb'
require_relative '../models/manager.rb'
require_relative '../views/employee_view.rb'

class EmployeesController
  class InvalidLevelError < StandardError
    def initialize(msg = 'Please enter 1, 2 or 3.')
      super(msg)
    end
  end

  def initialize(repository)
    @employees = repository
    @view = EmployeeView.new
  end

  def index
    display_employees
  end

  def add
    name = @view.ask_user_for('Qual é o nome do funcionário?')

    ocupations = LEVELABLE::OCUPATIONS
    msg = "Qual é o cargo do funcionário?\n"
    msg += "1: #{ocupations[:junior]}\n2: #{ocupations[:senior]}\n3: #{ocupations[:manager]}"
    ocupation = @view.ask_for_id(msg)
    raise InvalidLevelError unless [1, 2, 3].include?(ocupation)

    employee = Analyst.new(name: name, level: ocupations[:junior]) if ocupation == 1
    employee = Analyst.new(name: name, level: ocupations[:senior]) if ocupation == 2
    employee = Manager.new(name: name) if ocupation == 3
    @employees.add(employee)

    index
  end

  private

  def display_employees
    employees = @employees.all
    @view.display(employees)
  end
end
