require_relative '../utils/cryptho'
require_relative '../views/session_view'

class SessionsController
  def initialize(repository)
    @users = repository
    @view = SessionView.new
    @cryptho = Cryptho.new
  end

  def sign_in
    username = @view.ask_user_username
    password = @view.ask_user_password
    user = @users.find_by_username(username)
    if user && @cryptho.decrypt(password, user.password)
      system 'clear'
      user
    else
      @view.invalid_credentials
      sign_in
    end
  end
end
