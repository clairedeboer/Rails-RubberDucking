class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end 

  def create
    @student = Student.create(student_params)
    
    if @student.valid?
	    redirect_to student_path(@student)
    else
	    flash[:errors_array] = @student.errors.full_messages
	    redirect_to new_student_path
     end

  end

  def update
    # @student.update(student_params)
    # redirect_to student_path(@student)

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      flash[:errors_array] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def find_student
    @student = Student.find(params[:id])
  end 

  private
  def student_params
    params.require(:student).permit(:name, :mod)
  end
end
