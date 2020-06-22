# helpers
def generate_random_decimal
  rand(-10.000..10.000)
end
#----------------

users = [
  { first_name: 'Tywin', last_name: 'Lanister', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Walder', last_name: 'Frey', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Roose', last_name: 'Bolton', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Robb', last_name: 'Stark', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Catelyn', last_name: 'Stark', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Arya', last_name: 'Stark', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Talissa', last_name: 'Stark', created_at: Time.current, updated_at: Time.current },
  { first_name: 'Gregor', last_name: 'Forrester', created_at: Time.current, updated_at: Time.current },
]
User.insert_all!(users)
party = Party.create!(name: 'Red Wedding')

Location.create!(locatable: party, latitude: generate_random_decimal, longitude: generate_random_decimal)

User.all.each do |user|
  Location.create(locatable: user, latitude: generate_random_decimal, longitude: generate_random_decimal)
  Invitation.create!(party: party, user: user)
end

