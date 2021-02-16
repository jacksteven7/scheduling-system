class GradesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @grades = Grade.all.order(created_at: :desc)
    apply_filters
    render json: @grades
  end

  def show
    grade = Grade.find_by(id: params[:id])

    render json: grade
  end

  def create
    grade = Grade.create(grade_params)

    if grade.save
      render json: grade
    else
      render json: { error: grade.errors.messages }, status: 422
    end
  end

  def update
    grade = Grade.find_by(id: params[:id])
    if grade.update(grade_params)
      render json: grade
    else
      render json: { error: Grade.errors.messages }, status: 422
    end
  end

  def destroy
    grade = Grade.find_by(id: params[:id])

    if grade&.destroy!
      render json: { message: "Grade destroyed!" }
    else
      render json: { error: "Grade not found!" } , status: 422
    end
  end
  
  def students
    grade = Grade.find_by(id: params[:id])

    render json: { students: grade&.students }
  end

  def assign_students
    grade = Grade.find_by(id: params[:id])
    students = Student.where(id: params[:students_ids])

    grade.students << students
    render json: { message: "Students assigned succesfully!" }
  end

  private

  def grade_params
    params.require(:grade).permit(:code, :title, :description)
  end

  def apply_filters
    %i[code title description].each do |filter|
      @grades = @grades.where("#{filter.to_s} ilike ?", "%#{params[filter]}%") if params[filter] 
    end
  end
end
