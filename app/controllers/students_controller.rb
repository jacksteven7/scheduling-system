class StudentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @students = Student.all.order(created_at: :desc)
    apply_filters
    render json: @students
  end

  def show
    student = Student.find_by(id: params[:id])
    
    render json: student
  end

  def create
    student = Student.create(student_params)

    if student.save
      render json: student
    else
      render json: { error: student.errors.messages }, status: 422
    end
  end

  def update
    student = Student.find_by(id: params[:id])
    if student.update(student_params)
      render json: student
    else
      render json: { error: Student.errors.messages }, status: 422
    end
  end

  def destroy
    student = Student.find_by(id: params[:id])

    if student&.destroy!
      render json: { message: "Student destroyed!" }
    else
      render json: { error: "Student not found!" } , status: 422
    end
  end

  def grades
    student = Student.find_by(id: params[:id])
    render json: { grades: student&.grades }
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def apply_filters
    %i[first_name last_name].each do |filter|
      @students = @students.where("#{filter.to_s} ilike ?", "%#{params[filter]}%") if params[filter] 
    end
  end
end