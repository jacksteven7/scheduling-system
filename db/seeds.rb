# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = Student.create([{ first_name: "Jack", last_name: "Ibarra" }, { first_name: "Steven", last_name: "Marquez" }])

grades = Grade.create([{ code: "MT1", title: "Math" }, { code: "PH1", title: "Philosophy" }])

math = Grade.first
math.students << students

philosophy = Grade.last
philosophy.students << students.first