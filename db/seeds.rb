require "csv"
# coding: utf-8

CSV.foreach("db/csv/users.csv") do |row|
  User.create!(name: row[0], email: row[1], password: row[2], password_confirmation: row[2], image: row[3])
end

CSV.foreach("db/csv/categories.csv") do |row|
  Category.create!(id: row[0], name: row[1])
end

CSV.foreach("db/csv/workouts.csv") do |row|
  Workout.create!(id: row[0], name: row[1], category_id: row[2])
end

CSV.foreach("db/csv/records.csv") do |row|
  Record.create!(user_id: row[0], date: row[1], plan_flag: row[2], workout_id: row[3],
                weight: row[4], rep: row[5], set: row[6], interval: row[7], time: row[8],
                intensity: row[9], remark: row[10])
end