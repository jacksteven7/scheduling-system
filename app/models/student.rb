class Student < ApplicationRecord
  has_many :grade_enrollments
  has_many :grades, through: :grade_enrollments
end
