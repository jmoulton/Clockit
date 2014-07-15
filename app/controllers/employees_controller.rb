class EmployeesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :set_clock_in_error

  expose!(:employee)
  expose!(:employees) { Employee.all }

  def index
  end

  def show
  end

  def edit
  end

  def clock
    employee = Employee.find(params[:employee])
    case params[:button]
    when "Clock In"
      clock_in(employee)
    when "Clock Out"
      clock_out(employee)
    else
      set_clock_in_error("Could Not Process Request, Please Try Again Later")
    end
  end

  def clock_in(employee)
    employee.clock_in! ? (set_clock_success(employee, "Clocked In")) : set_clock_in_error("Employee Is Already Signed In")
  end

  def clock_out(employee)
     employee.clock_out! ? (set_clock_success(employee, "Clocked Out")) : set_clock_in_error("Employee Is Already Signed Out")
  end

  def set_clock_in_error(msg)
    flash[:error] = "#{msg}"
    redirect_to employees_path
  end

  def set_clock_success(employee, msg)
    flash[:notice] = "Employee Successfully #{msg}"
    redirect_to employee_successful_clock_path(employee)
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

  def successful_clock
  end

  def reports

  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :rank)
    end
end
