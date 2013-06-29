get '/decks' do
  @decks = Deck.all
  erb :"decks/all_decks"
end

get '/deck/:id' do |id|
  @deck = Deck.find(id)
  if !session[:round]
    session[:round] = 'yes'
    @round = Round.create(user_id: session[:user_id], deck_id: @deck.id)
  end
  erb :"/decks/play"
end


post '/decks/:deck_id/:card_id' do |deck_id, card_id|
  #DETERMINE IF GUESS IS CORRECT OR WRONG
  content_type :json
  {cardId: card_id, nextCard: (card_id.to_i + 1)}.to_json
end
