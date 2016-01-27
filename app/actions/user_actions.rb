
get '/users/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  
  unless @user == nil
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'users/login'
  end
  
end


get '/logout' do
  #session[:user_id] = nil
  session.clear
  redirect '/'
end



get '/users/signup' do
  erb :'users/signup'
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

    erb :'users/signup'
  end
end
