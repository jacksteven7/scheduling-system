module Api
  module V1
    class GradesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        grades = Grade.all.order(created_at: :desc)

        render json: grades
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

      def destroy
        grade = Grade.find_by(id: params[:id])

        if grade&.destroy!
          render json: { message: "Grade destroyed!" }
        else
          render json: { error: "Grade not found!" } , status: 422
        end
      end

      private

      def student_params
        params.require(:grade).permit(:code, :title, :description)
      end

    end
  end
end