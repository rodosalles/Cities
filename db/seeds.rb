# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
country = Country.create!(name: 'Brasil', acronym: 'BR')

states = State.create!([
                         { name: 'Paraná', acronym: 'PR', country_id: country.id },
                         { name: 'Santa Catarina', acronym: 'SC', country_id: country.id },
                         { name: 'Rio Grande do Sul', acronym: 'RS', country_id: country.id }
                       ])

cities = City.create!([
                        { name: 'Curitiba', state_id: states[0].id },
                        { name: 'Londrina', state_id: states[0].id },
                        { name: 'Maringá', state_id: states[0].id },
                        { name: 'Florianópolis', state_id: states[1].id },
                        { name: 'Joinville', state_id: states[1].id },
                        { name: 'Blumenau', state_id: states[1].id },
                        { name: 'Porto Alegre', state_id: states[2].id },
                        { name: 'Caxias do Sul', state_id: states[2].id },
                        { name: 'Pelotas', state_id: states[2].id }
                      ])
