# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GENDER = ['Hombre', 'Mujer']
DNI = (20000000..35000000).to_a
CONTACT_SOURCE = ['whatsapp', 'mail', 'telefono', 'skype']
CONTACT_VALUES = {'whatsapp' => Faker::PhoneNumber.cell_phone,
                  'mail' => Faker::Internet.email,
                  'telefono' => Faker::PhoneNumber.cell_phone,
                  'skype' => Faker::Internet.user_name,
                  }


# Clients
10.times do
  client = Client.create(name: Faker::Name.first_name,
                        surname: Faker::Name.last_name,
                        gender: GENDER.sample,
                        dni: DNI.sample,
                        birthdate: Faker::Time.between(70.years.ago, 20.years.ago),
                        cui: Faker::Company.ein,
                        )
  Contact.create(source: cs = CONTACT_SOURCE.sample,
                 value: CONTACT_VALUES[cs],
                 client_id: client.id,
                )
end


# People
10.times do
  Person.create(name: Faker::Name.name, cui: Faker::Company.ein)
end


# Bills
clients_id = Client.pluck(:id).shuffle
people_id = Person.pluck(:id).shuffle
30.times do
  Bill.create(description: Faker::Commerce.product_name,
              total: Faker::Commerce.price,
              emission_date: Faker::Time.between(5.years.ago, DateTime.now),
              person_id: people_id.sample ,
              client_id: clients_id.sample,
              )
end
