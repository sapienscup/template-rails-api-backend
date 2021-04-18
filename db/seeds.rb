# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).to_a.each do |index|
  Account.create(
    api_token: "token#{index}",
    email: "email#{index}@gmail.com.br",
    name: "name#{index}",
    password: "pass#{index}"
  )
end
