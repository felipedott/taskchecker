# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Criando 9 jogadores...'
# User 01 - 03
User.create!(email: 'tecnico@tite.com', password: 'secret', first_name: 'Adenor', last_name: 'Tite')
User.create!(email: 'neymar@junior.com', password: 'secret', first_name: 'Neymar', last_name: 'Jr')
User.create!(email: 'richarlison@andrade.com', password: 'secret', first_name: 'Richarlison', last_name: 'Pombo')

# User 04 - 06
User.create!(email: 'cristiano@ronaldo.com', password: 'secret', first_name: 'Cristiano', last_name: 'Ronaldo')
User.create!(email: 'rui@patricio.com', password: 'secret', first_name: 'Rui', last_name: 'Patricio')
User.create!(email: 'bruno@fernandes.com', password: 'secret', first_name: 'Bruno', last_name: 'Fernandes')

# User 07 - 9
User.create!(email: 'lionel@messi.com', password: 'secret', first_name: 'Lionel', last_name: 'Messi')
User.create!(email: 'paulo@dybala.com', password: 'secret', first_name: 'Paulo', last_name: 'Dybala')
User.create!(email: 'angel@dimaria.com', password: 'secret', first_name: 'Angel', last_name: 'Di Maria')

puts 'Criando 3 times...'
# Team 01 - 03
Team.create!(name: 'Brazil')
Team.create!(name: 'Portugal')
Team.create!(name: 'Argentina')

puts 'Adicionando 3 jogadores em cada time...'
# TeamMembers p/ Team 01
TeamMember.create!(admin: true, team_id: 1, user_id: 1)
TeamMember.create!(admin: false, team_id: 1, user_id: 2)
TeamMember.create!(admin: false, team_id: 1, user_id: 3)

# TeamMembers p/ Team 02
TeamMember.create!(admin: true, team_id: 2, user_id: 4)
TeamMember.create!(admin: false, team_id: 2, user_id: 5)
TeamMember.create!(admin: false, team_id: 2, user_id: 6)

# TeamMembers p/ Team 03
TeamMember.create!(admin: true, team_id: 3, user_id: 7)
TeamMember.create!(admin: false, team_id: 3, user_id: 8)
TeamMember.create!(admin: false, team_id: 3, user_id: 9)

puts 'Done!'
