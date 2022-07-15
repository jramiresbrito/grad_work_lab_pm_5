require_relative 'base_repository'
require_relative '../models/analyst'
require_relative '../models/manager'

class EmployeeRepository < BaseRepository
  private

  def deserialize(row)
    row[:id] = row[:id].to_i
    row[:bonus_modifier] = row[:bonus_modifier].to_i

    if row[:ocupation] == LEVELABLE::OCUPATIONS[:junior] || row[:ocupation] == LEVELABLE::OCUPATIONS[:senior]
      return Analyst.new(row)
    end

    return Manager.new(row) if row[:ocupation] == LEVELABLE::OCUPATIONS[:manager]
  end
end
