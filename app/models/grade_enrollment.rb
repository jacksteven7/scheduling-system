class GradeEnrollment < ApplicationRecord
  belongs_to :student
  belongs_to :grade
end
