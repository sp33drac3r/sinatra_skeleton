get '/signup' do
  erb :"users/sign_up_or_login", layout: !request.xhr?
end

get '/login' do
  erb :"users/sign_up_or_login", layout: !request.xhr?
end

get '/logout' do
  logout!
  redirect '/'
end

post "/users" do
  @user = User.new(params['user'])
  if @user.save
    login(@user)
    redirect '/'
  else
    erb :sign_up_or_login
  end
end

post '/login' do
  @user = User.authenticate(params["user"])
  if @user
    login(@user)
  end
  redirect '/'
end
