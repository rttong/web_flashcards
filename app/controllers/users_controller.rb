enable :sessions

post '/login' do
  @user = User.find_by_name(params[:username])
  input_password = params[:password]
  if @user && input_password && @user.password == input_password
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create :name => params[:username],
                      :email => params[:email],
                      :password => params[:password]
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/signup'
  end
end

before '/stats' do
  redirect '/' unless session[:user_id]
end


get '/stats' do
  user = User.find(session[:user_id])
  erb :"users/stats"
end
