enable :sessions

helpers do
  def current_user
    #@current_user ||= User.find_by(id: session[:user_id])
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  current_user ? (redirect '/songs') : (erb :index)
end

get '/songs' do
  redirect 'songs/song_index'
end


get '/songs/song_index' do
  @songs = Song.all
  erb :'songs/song_index'
end


get '/songs/song_new' do
  erb :'songs/song_new'
end

post '/songs' do
  @song = Song.new(
    user_id: current_user.id,
    title: params[:title],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/song_new'
  end
end


get '/users/user_login' do
  erb :'users/user_login'
end

post '/login' do

  @user = User.find_by(email: params[:email], password: params[:password])
  if @user == nil
    erb :'users/user_login'
  else
    session[:user_id] = @user.id
    redirect '/songs'   
  end
  
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

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
