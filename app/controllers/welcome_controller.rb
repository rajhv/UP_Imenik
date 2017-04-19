class WelcomeController < ApplicationController

  def index
    @departments = Department.dep_member(params[:mem])
    #@employees = Employee.joins(:department).where('employees.department_id =? and departments.member_id = ?',params[:dep].to_i, params[:mem].to_i).order(:name)
    @employees = Employee.emp_name_number(params[:emp]).emp_department(params[:dep]).order(:name)
    #if params[:mem]='Vse članice'
    #    @employees = Employee.all
    #else
    #  @employees =Employee.first
      #@employees = Employee.joins(:department).where('employees.department_id =? and departments.member_id = ?',params[:dep], params[:mem]).order(:name)
    #end
    #@employees = Employee.emp_name_number(params[:emp]).emp_department(params[:dep]).order(:name)
    #@employees = Employee.emp_name_number(params[:emp]).where(department_id: params[:dep])
    #@employees = Employee.emp_number(params[:emp])
    #@employees = Employee.emp_department(params[:emp])
    #@employees = Employee.search(params[:emp])
    #@employees = Employee.all
    #@employees = Employee.where(department_id: [7,12])
    #@employees = Employee.(params("department[member_id]"))
    #@employees = Employee.where("department_id = ?", params[:department_id])
    #@employees = Employee.where("name ILIKE ?", params[:q])
    #@departments = Department.search(params[:department])
    #@members = Member.search(params[:member])
    #@employees = Employee.where(department_id: params(department_id))
  end


end
