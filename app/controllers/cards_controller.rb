# post '/cards/:id' do |id|
#   guess = params[:guess]
#   answer = Card.find(id).answer

#   if guess == answer
#     erb :correct
#   else
#     erb :incorrect
#   end
# end