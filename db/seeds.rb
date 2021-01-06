require "csv"
# coding: utf-8

CSV.foreach("db/csv/users.csv", headers: true) do |row|
  User.create!(name: row["name"], email: row["email"],
               password: row["password"], password_confirmation: row["password_confirmation"],
               remember_digest: row["remember_digest"],
               image: row["image"].present? ? File.open("#{Rails.root}/db/fixtures/#{row[3]}") : nil)
end

CSV.foreach("db/csv/categories.csv", headers: true) do |row|
  Category.create!(id: row["id"], name: row["name"])
end

CSV.foreach("db/csv/workouts.csv", headers: true) do |row|
  Workout.create!(id: row["id"], name: row["name"], category_id: row["category_id"])
end

CSV.foreach("db/csv/records.csv", headers: true) do |row|
  Record.create!(user_id: row["user_id"], date: row["date"],
                 do_flag: row["do_flag"], workout_id: row["workout_id"], cardio_flag: row["cardio_flag"],
                 weight: row["weight"], rep: row["rep"], set: row["set"], interval: row["interval"],
                 time: row["time"], intensity_id: row["intensity_id"], remark: row["remark"])
end

CSV.foreach("db/csv/intensities.csv", headers: true) do |row|
  Intensity.create!(id: row["id"], name: row["name"])
end
