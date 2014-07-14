class EmployeesController < ApplicationController
  expose!(:employee)
  expose!(:employees) { Employee.all }

  def index
  end

  def show
  end

  def edit
  end

  def employees_clock_in
    employee = Employee.find(params[:employee])

    if params[:commit] == "Clock In"
      employee.clock_in! ? (redirect_to employee_success_path) : set_clock_in_error("Employee Is Already Signed In")
    else
      set_clock_in_error("Could Not Process Request, Please Try Again Later")
    end
  rescue ActiveRecord::RecordNotFound
    set_clock_in_error("Employee could not be found")
  end

  def employees_clock_out
    if params[:commit] == "Clock Out"
      employee.clock_out! ? (redirect_to employeed_path) : set_clock_in_error("Employee Is Already Signed Out")
    else
      set_clock_in_error("Could Not Process Request, Please Try Again Later")
    end
  end

  def set_clock_in_error(msg)
    flash[:error] = "Employee has aready been clocked #{msg}"
    redirect_to employees_path
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
