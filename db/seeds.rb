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
                 cardio_flag: row[4], weight: row[5], rep: row[6], set: row[7], interval: row[8],
                 time: row[9], intensity_id: row[10], remark: row[11])
end

CSV.foreach("db/csv/intensities.csv") do |row|
  Intensity.create!(id: row[0], name: row[1])
end