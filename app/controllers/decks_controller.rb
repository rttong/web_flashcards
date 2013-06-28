get '/decks' do
  @decks = Deck.all
  erb :"decks/all_decks"
end

get '/deck/:id' do |id|
  deck = Deck.find(id)
  @card = deck.cards.sample
  erb :"/cards/show"
end
