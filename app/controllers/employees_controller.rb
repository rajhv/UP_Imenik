class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path
    else
      render 'error'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :number, :department_id, :member_id)
    end


end
