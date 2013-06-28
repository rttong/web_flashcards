require 'faker'

deck = Deck.create(name: "Boots")

10.times do 
  deck.cards << Card.create(question: Faker::Lorem.sentence, answer: "true")
end