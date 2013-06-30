before '/deck*' do
  redirect '/' unless session[:user_id]
end

get '/decks' do
  @decks = Deck.all
  erb :"decks/all_decks"
end

get '/deck/:id' do |id|
  @deck = Deck.find(id)
    if !session[:round]
      round = Round.create(user_id: session[:user_id], deck_id: @deck.id)
      session[:round] = round.id
    end
  erb :"/decks/play"
end


post '/decks/:deck_id/:card_id' do |deck_id, card_id|
  round = Round.find(session[:round])
  if params[:guess] == Card.find(card_id).answer
    round.update_attributes!(correct: round.correct += 1)
  else
    round.update_attributes!(incorrect: round.incorrect += 1)
  end
  content_type :json
  {correct: round.correct, incorrect: round.incorrect}.to_json
end
