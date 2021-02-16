class Grade < ApplicationRecord
  has_many :grade_enrollments
  has_many :students, through: :grade_enrollments
end
