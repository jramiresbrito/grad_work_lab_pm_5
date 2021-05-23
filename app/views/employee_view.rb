require_relative 'base_view'
require_relative '../interfaces/levelable'

class EmployeeView < BaseView
  include LEVELABLE

  def display(employees)
    employees.each do |employee|
      msg = "ID:#{employee.id.to_s.blue} Name: #{employee.name.yellow} "

      if employee.level == LEVELABLE::OCUPATIONS[:junior]
        msg += "Ocupation: #{employee.level.cyan} "
        msg += "Extra Hours: #{employee.bonus_modifier.to_s.green}\n"
      end

      if employee.level == LEVELABLE::OCUPATIONS[:senior]
        msg += "Ocupation: #{employee.level.yellow} "
        msg += "Extra Hours: #{employee.bonus_modifier.to_s.green}\n"
      end

      if employee.level == LEVELABLE::OCUPATIONS[:manager]
        msg += "Ocupation: #{employee.level.red} "
        msg += "Projects: #{employee.bonus_modifier.to_s.green}\n"
      end

      puts msg
    end
  end
end
