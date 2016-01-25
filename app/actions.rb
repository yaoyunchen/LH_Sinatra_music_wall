# Homepage (Root path)
get '/' do
  #erb :index
  erb :index
end


get '/songs' do
  @songs = Song.all
  erb :'song/index'
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


