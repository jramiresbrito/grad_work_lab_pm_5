require 'highline/import'
require_relative '../utils/colorize'

class SessionView
  def initialize(login_attempts = 1)
    @login_attempts = login_attempts
  end

  def ask_user_username
    puts 'Please, enter your username'.yellow
    print '> '.red
    gets.chomp
  end

  def ask_user_password
    puts 'Please, enter your password'.yellow
    ask('> '.red) { |q| q.echo = '*'.green }
  end

  def display(usuarios)
    usuarios.each do |usuario|
      puts "ID:#{usuario.id.to_s.blue} Username: #{usuario.nome.yellow}"
    end
  end

  def failed_to_login
    @login_attempts += 1
  end

  def login_limit_exceed
    system 'clear'
    3.downto(1) do |i|
      puts 'Failed to login ' + @login_attempts.to_s.red + ' times.'
      puts 'Closing in ' + i.to_s.yellow + '...'
      sleep(1)
      system 'clear'
    end
    exit
  end

  def invalid_credentials
    login_limit_exceed if @login_attempts == 3
    failed_to_login
    system 'clear'
    puts 'Invalid credentials.'.red
    puts 'Remaining attempts: ' + (4 - @login_attempts).to_s.yellow
    puts ''
  end
end
