# Homepage (Root path)
get '/' do
  #erb :index
  erb :index
end


get '/songs' do
  redirect 'songs/index'
end


get '/songs/index' do
  @songs = Song.all
  erb :'songs/index'
end


get '/songs/new' do
  erb :'songs/new'
end


post '/songs' do
  @song = Song.new(
    author: params[:author],
    title: params[:title],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end


