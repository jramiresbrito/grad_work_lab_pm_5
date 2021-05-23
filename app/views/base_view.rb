require_relative '../utils/colorize'

class BaseView
  def ask_user_for(stuff)
    puts stuff.to_s.capitalize
    print '> '
    gets.chomp
  end

  def ask_for_id(stuff)
    puts stuff
    print '> '
    gets.chomp.to_i
  end

  def display(stuffs); end
end
