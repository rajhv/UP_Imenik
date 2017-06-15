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

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(department_params)
    @department.member_id = params[:mem]
    if @department.save
      respond_to do |format|
        format.html {redirect_to departments_path}
        format.js
      end
      else
        render 'error'
        #render plain: params[:department].inspect
      end
  end

  def update
    @department = Department.find(params[:id])
    @department.member_id = params[:mem]
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to departments_path, notice: 'Oddelek je spremenjen!' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :error }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    respond_to do |format|
      format.html {redirect_to members_path}
      format.js
    end
  end

  private
    def department_params
      params.require(:department).permit(:name, :member_id)
    end

end
