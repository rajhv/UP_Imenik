class WelcomeController < ApplicationController

  # initialy load all employees
  def index
    @employees = Employee.all
  end

  # load employees for member/department/all
  def search
    if params[:dep].present? # if department is defined find only that department
      @departments = Department.find_by_id(params[:dep])
    elsif params[:mem].present? # if member is defined find departments for that member
      @departments = Department.where("member_id = ?", params[:mem])
      #@departments = Member.find_by_id(params[:mem]).try(:departments)
    else # if nthing is specified find all employees
      @departments = Department.all
    end

      @query = params[:query]
    
    @employees = Employee.find_by_name_or_number_or_email(@query).find_by_departments(@departments)
  end
end
