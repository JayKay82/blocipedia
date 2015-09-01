require 'faker'

# Create an admin user
admin = User.new(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'heisenberg'
)
admin.skip_confirmation!
admin.save!

# Create a premium user
premium = User.new(
  name: 'Premium',
  email: 'premium@example.com',
  password: 'heisenberg',
  premium_at: Time.now
)
premium.skip_confirmation!
premium.save!

# Create a standard user
standard = User.new(
  name: 'Standard',
  email: 'standard@example.com',
  password: 'heisenberg'
)
standard.skip_confirmation!
standard.save!

# Create standard users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

# Create premium users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    premium_at: Time.now
  )
  user.skip_confirmation!
  user.save!
end

# All users
users = User.all

# Create public wikis
20.times do
  wiki = Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: users.sample
  )
end

# Create private wikis
10.times do
  wiki = Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: true,
    user: users.sample
  )
end

# Seed data info
puts "#{User.count} users seeded."
puts "#{Wiki.count} wikis seeded."
