# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "Binh", email: "binh@gmail.com",
                    password: "password",
                    password_confirmation: "password")
30.times do |n|
  user.posts.create!(title: "Auto generate title #{n}",
                    body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt consequatur illum inventore, aspernatur quasi blanditiis cumque qui iure officiis pariatur ullam fuga ratione, sit perspiciatis recusandae tempore magnam modi delectus.")
end

