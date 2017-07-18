# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["Jobs", "Projects", "Other"]
likes = ["Post", "Comment", "Project"]


10.times do 
  User.create(
    username: Faker::GameOfThrones.character,
    password: "password",
    testimonial: Faker::Lorem.sentence(2)
  )

  Post.create(
    title: Faker::HarryPotter.quote,
    body: Faker::Lorem.sentence(10),
    category: categories.sample,
    user_id: rand(1..10) 
  )

  Project.create(
    title: Faker::App.name,
    description: Faker::Lorem.sentence(1),
    url: Faker::Internet.url
  )

  UserProject.create(
    user_id: rand(1..10),
    project_id: rand(1..10)
  )
end


20.times do 
  Job.create(
    title: Faker::Job.title,
    company_id: rand(1..20),
    user_id: rand(1..10)
  )

  Company.create(
    name: Faker::Company.name,
    description: Faker::Lorem.sentence(1),
    url: Faker::Internet.url
  )

  CompanyUser.create(
    user_id: rand(1..10),
    company_id: rand(1..20)
  )

  Comment.create(
    body: Faker::Lorem.sentence(1),
    post_id: rand(1..10),
    user_id: rand(1..10)
  )

  Like.create(
    likeable_type: likes.sample,
    likeable_id: rand(1..10),
    user_id: rand(1..10)
  )
end 

