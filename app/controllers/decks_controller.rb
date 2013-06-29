get '/decks' do
  @decks = Deck.all
  erb :"decks/all_decks"
end

get '/deck/:id' do |id|
  deck = Deck.find(id)
  if !session[:round]
    session[:round] = 'yes'
    @round = Round.create(user_id: session[:user_id], deck_id: deck.id)
  end
  @card = deck.cards.shuffle!.pop
  erb :"/decks/play"
end

get '/cards'
end


