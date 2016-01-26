
get '/users/user_login' do
  erb :'users/user_login'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  
  unless @user == nil
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'users/user_login'
  end
  
end


get '/logout' do
  #session[:user_id] = nil
  session.clear
  redirect '/'
end



get '/users/user_signup' do
  erb :'users/user_signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    name: params[:name]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else

    erb :'users/user_signup'
  end
end
