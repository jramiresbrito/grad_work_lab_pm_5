require_relative '../utils/colorize'

class RouterView
  def print_user_menu(name)
    puts ''
    puts "#{'Hi'.green}, #{name.yellow} #{'please select an option'.green}"

    user_options
  end

  private

  def user_options
    puts '╔══════════════════════════════════════════╗'
    puts "║      #{'1  - Add new employee'.yellow}               ║"
    puts "║      #{'2  - List employees'.yellow}                 ║"
    puts "║      #{'4  - Clear screen'.cyan}                   ║"
    puts "║      #{'5  - Logoff'.cyan}                         ║"
    puts "║      #{'0  - Terminate'.pink}                      ║"
    puts '╚══════════════════════════════════════════╝'
  end
end
