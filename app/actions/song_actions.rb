get '/songs' do
  redirect 'songs/song_index'
end


get '/songs/song_index' do
  @songs_votes = Song.joins(:votes).group("songs.id").order("COUNT(votes.user_id) DESC")
  @songs_all = Song.all
  @songs = (@songs_votes + @songs_all).uniq
  erb :'songs/song_index'
end


get '/songs/song_new' do
  erb :'songs/song_new'
end

get '/search' do
  @song = Song.find params[:id]
  @reviews = Review.where(song_id: params[:id]).order(created_at: :DESC)
  erb :'songs/song_detail'
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