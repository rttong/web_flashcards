enable :sessions

post '/login' do
  @user = User.find_by_email(params[:username])
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