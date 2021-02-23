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
  { first_name: 'Daenerys', last_name: 'Targarien', created_at: Time.current, updated_at: Time.current },
  { first_name: nil, last_name: nil, created_at: Time.current, updated_at: Time.current },
  { first_name: nil, last_name: nil, created_at: Time.current, updated_at: Time.current },
  { first_name: nil, last_name: nil, created_at: Time.current, updated_at: Time.current },
  { first_name: nil, last_name: nil, created_at: Time.current, updated_at: Time.current },
]
User.insert_all!(users)
party = Party.create!(name: 'Red Wedding')

Location.create!(locatable: party, latitude: generate_random_decimal, longitude: generate_random_decimal)

User.all.each do |user|
  Location.create(locatable: user, latitude: generate_random_decimal, longitude: generate_random_decimal)
  Invitation.create!(party: party, user: user)
end

Invitation.joins(:user).merge(User.where(last_name: ['Lanister'])).update_all(state: 'busy_that_day')
Invitation.joins(:user).merge(User.where(last_name: ['Frey', 'Bolton'])).update_all(state: 'prepared_to_go')
Invitation.joins(:user).merge(User.where(last_name: ['Stark'])).update_all(state: 'dying_to_go')
Invitation.joins(:user).merge(User.where(first_name: 'Arya', last_name: ['Stark'])).update_all(state: 'arriving_late')
Invitation.joins(:user).merge(User.where(last_name: ['Targarien'])).update_all(state: 'too_far_away')

