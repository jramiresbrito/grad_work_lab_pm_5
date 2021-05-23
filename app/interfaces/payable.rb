module PAYABLE
  BASE_SALARY = 2500.0
  JUNIOR_BASE_SALARY = BASE_SALARY
  SENIOR_BASE_SALARY = JUNIOR_BASE_SALARY * 1.5
  MANAGER_BASE_SALARY = BASE_SALARY

  def bonus
    raise 'Not implemented'
  end

  def erase_bonus
    raise 'Not implemented'
  end

  def pay
    raise 'Not implemented'
  end

  def base_salary
    raise 'Not implemented'
  end
end
