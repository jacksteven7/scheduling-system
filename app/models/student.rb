class Student < ApplicationRecord
  has_many :grades_enrrolments
  has_many :grades, through: :subjects
end
