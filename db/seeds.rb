require 'faker'

puts "Creating users!"
user_hash = {}
10.times do |count|
  first_name = Faker::Name.first_name
  user_hash[count] = User.create!(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username: Faker::Internet.username(specifier: first_name),
    addr_city: Faker::Address.city,
    password: "123456"
  )
  puts "#{(count + 1).ordinalize} user created!"
end

puts "Seeding inboxes and messages"

10.times do |count|
  inbox = Inbox.create!(name: Faker::Marketing.buzzwords)
  puts "Inbox #{count + 1} created! Seeding messages now"
  user1 = user_hash[count]
  user2 = user_hash[count + 1] || user_hash[0]
  rand(5..10).times do
    Message.create!(inbox: inbox, user: user1, content: Faker::Quote.matz)
    Message.create!(inbox: inbox, user: user2, content: Faker::Quote.matz)
  end
  puts "Messages seeded for #{user1.first_name} and #{user2.first_name}!"
end
