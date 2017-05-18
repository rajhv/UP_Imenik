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
    @employee.department_id = params[:dep]
    if @employee.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      render 'error'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :number, :email, :department_id, :member_id)
    end


end
