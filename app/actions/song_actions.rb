get '/songs' do
  redirect 'songs/index'
end


get '/songs/index' do
  @songs_votes = Song.joins(:votes).group("songs.id").order("COUNT(votes.user_id) DESC")
  @songs_all = Song.all
  @songs = (@songs_votes + @songs_all).uniq
  erb :'songs/index'
end

  
get '/songs/new' do
  erb :'songs/new'
end

get '/search' do
  @song = Song.find params[:id]
  @reviews = Review.where(song_id: params[:id]).order(created_at: :DESC)
  @user_reviewed = Review.find_by(user_id: current_user.id, song_id: @song.id)

  erb :'songs/detail'
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
    erb :'songs/new'
  end
end