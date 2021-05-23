require_relative 'app/repositories/user_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/router'

users = UserRepository.new('data/users.csv')
employees = EmployeeRepository.new('data/employees.csv')

Router.new(users, employees).run
