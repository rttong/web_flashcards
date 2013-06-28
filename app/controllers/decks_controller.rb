get '/decks' do
  @decks = Deck.all
  erb :"decks/all_decks"
end

get '/deck/:id' do |id|
  @deck = Deck.find(id)
  # cards = deck.cards.shuffle
  erb :"/decks/play"
end


# post '/guess' do
#   guess = params[:guess]
#   card.answer
# end

get '/correct' do
  erb :_correct
end

get '/incorrect' do
  erb :_incorrect
end

