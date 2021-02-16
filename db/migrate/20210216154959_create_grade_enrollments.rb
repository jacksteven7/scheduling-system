class CreateGradeEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_enrollments do |t|
      t.references :student, foreign_key: true
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
