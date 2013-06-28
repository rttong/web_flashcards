

deck = Deck.create(name: "Boots")

10.times do 
  deck.cards << Card.create(question: Faker::Lorem.sentence, answer: "true")


counter = 1
5.times do
  User.create :name     => "Admin #{counter}",
              :email    => "admin#{counter}@test.com",
              :password => "password"
  counter += 1
end