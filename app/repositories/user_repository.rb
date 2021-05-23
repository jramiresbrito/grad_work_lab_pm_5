require_relative '../models/user'
require_relative 'base_repository'

class UserRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |user| user.username == username }
  end

  undef_method :add

  private

  def deserialize(row)
    row[:id] = row[:id].to_i
    User.new(row)
  end
end
