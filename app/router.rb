require_relative 'utils/colorize'
require_relative 'views/router_view'
require_relative 'controllers/employees_controller'
require_relative 'controllers/sessions_controller'

class Router
  attr_accessor :name

  def initialize(users, employees)
    @session_controller = SessionsController.new(users)
    @employee_controller = EmployeesController.new(employees)
    @view = RouterView.new
    @user = nil
  end

  def run
    @user = @session_controller.sign_in until @user
    @name = @user.username.capitalize
    user_loop
  end

  private

  def user_menu(choice)
    case choice
    when 1 then @employee_controller.add
    when 2 then @employee_controller.index
    when 4 then system 'clear'
    when 5 then sign_out
    when 0 then exit
    else
      puts 'Invalid option'.red
    end
  end

  def user_loop
    loop do
      @view.print_user_menu(@name)
      choice = gets.chomp.to_i
      system 'clear'
      user_menu(choice)
    end
  end

  def sign_out
    system 'clear'
    puts 'Login off...'.green
    sleep 1
    system 'clear'
    @user = nil

    run
  end
end
