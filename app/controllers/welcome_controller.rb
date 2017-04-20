class WelcomeController < ApplicationController

  # initialy load all employees
  def index
    @employees = Employee.all
  end

  # load employees for member/department/all
  def search
    # if member is defined find departments for that member
    if params[:mem]
      @departments = Member.find_by_id(params[:mem]).try(:departments)
    elsif params[:dep] # if department is defined find only that department
      @departments = Department.find_by_id(params[:dep])
    else # if nothing is specified find all employees
      @departments = Department.all
    end
    
    @query = params[:query]

    @employees = Employee.find_by_departments(@departments).find_by_name_or_number(@query)
  end
end
