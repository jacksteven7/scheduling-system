class Grade < ApplicationRecord
  has_many :grades_enrrolments
  has_many :students, through: :grades_enrrolments
end
