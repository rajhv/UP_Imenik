class DepartmentsController < ApplicationController
  def index
    if params[:mem]
      @departments = Department.where(member: params[:mem])
    else
      @departments = Department.all
    end
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
      if @department.save
        redirect_to departments_path
      else
        render 'error'
        #render plain: params[:department].inspect
      end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end

  private
    def department_params
      params.require(:department).permit(:name, :member_id)
    end

end
