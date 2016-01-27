enable :sessions

helpers do
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
    #User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  current_user ? (redirect '/songs') : (erb :'users/login')
end


post '/vote' do
  Vote.create!(
    user_id: current_user.id,
    song_id: params[:song_id]
  )
  redirect '/songs'
end


post '/review' do
  @review = Review.create!(
    user_id: current_user.id,
    song_id: params[:song_id],
    review: params[:review],
    rating: params[:rating]
  )
  redirect "/search?id=#{@review.song_id}"
end


delete '/review/:id/delete' do
  @review = Review.find params[:id]
  @song_id = @review.song.id
  @review.destroy
  redirect "/search?id=#{@song_id}"
end


