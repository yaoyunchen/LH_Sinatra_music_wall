# Homepage (Root path)
get '/' do
  #erb :index
  erb :index
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
    author: params[:author],
    title: params[:title],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/song_new'
  end
end


