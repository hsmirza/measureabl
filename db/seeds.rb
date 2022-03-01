# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'test-user@gmail.com', password: 'password', password_confirmation: 'password')
Portfolio.create!(user_id: User.last.id, name: 'Test')
Site.create!(portfolio_id: Portfolio.last.id, name: 'Test Site')
Space.create!(site_id: Site.last.id, name: 'Test Space', space_type: 0, area: 1)
Space.create!(site_id: Site.last.id, name: 'Test Space', space_type: 1, area: 2)
Space.create!(site_id: Site.last.id, name: 'Test Space', space_type: 2, area: 3)
