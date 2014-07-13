class EmployeesController < ApplicationController
  expose!(:employee, attributes: :employee_params)
  expose!(:employees) { Employee.all }

  def index
  end

  def show
  end

  def edit
  end

  def create
    employee = Employee.new(employee_params)

    respond_to do |format|
      if employee.save
        format.html { redirect_to employee, notice: 'Employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: employee }
      else
        format.html { render action: 'new' }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if employee.update(employee_params)
        redirect_to employee, notice: 'Employee was successfully updated.'
      else
        format.html { render action: 'edit' }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    employee.destroy
    redirect_to employees_url
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :rank)
    end
end
