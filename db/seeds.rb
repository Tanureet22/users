require 'csv'
require 'faker'

# Clear existing data
User.destroy_all
Language.destroy_all

# Seed data from users.csv
CSV.foreach(Rails.root.join('db', 'users.csv'), headers: true, col_sep: ';') do |row|
  User.create(
    id: row['User-ID'],
    location: row['Location'],
    age: row['Age'].presence
  )
end

# Seed data with Faker for Languages
User.all.each do |user|
  3.times do
    Language.create!(
      name: Faker::Nation.language,
      rating: rand(1..5),
      time_period: ["Ancient", "Medieval", "Modern"].sample,
      country_spoken: Faker::Address.country,
      user: user
    )
  end
end
