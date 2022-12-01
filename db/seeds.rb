# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: 'teste@teste.com', password: 'secret', first_name: 'First_Name 01', last_name: 'Last_Name 01')
User.create!(email: 'cristiano@ronaldo.com', password: 'secret', first_name: 'Cristiano', last_name: 'Ronaldo')
User.create!(email: 'lionel@messi.com', password: 'secret', first_name: 'Lionel', last_name: 'Messi')
User.create!(email: 'neymar@junior.com', password: 'secret', first_name: 'Neymar', last_name: 'Jr')


Team.create!(name: 'Team 01')
Team.create!(name: 'Portugal')
Team.create!(name: 'Argentina')

TeamMember.create!(admin: true, team_id: 1, user_id: 1)
TeamMember.create!(admin: true, team_id: 2, user_id: 2)
TeamMember.create!(admin: true, team_id: 3, user_id: 3)
TeamMember.create!(admin:false, team_id: 1, user_id: 4)
