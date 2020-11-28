require "csv"
# coding: utf-8

CSV.foreach("db/csv/users.csv") do |row|
  User.create(name: row[0], email: row[1], password: row[2], password_confirmation: row[2], image: row[3])
end

CSV.foreach("db/csv/exercise_categories.csv") do |row|
  ExerciseCategory.create(name: row[0], muscle_parts_id: row[1])
end

CSV.foreach("db/csv/muscle_parts.csv") do |row|
  MusclePart.create(id: row[0], name: row[1], image: row[2])
end

CSV.foreach("db/csv/workouts.csv") do |row|
  Workout.create(user_id: row[0], date: row[1], whether_plan: row[2], exercise_id: row[3],
                 muscle_parts_id: row[4], weight: row[5], rep: row[6], set: row[7],
                 interval: row[8], time: row[9], intensity: row[10], remark: row[11])
end