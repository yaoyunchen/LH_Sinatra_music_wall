enable :sessions

helpers do
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
    #User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  current_user ? (redirect '/songs') : (erb :'users/user_login')
end


post '/vote' do
  Vote.create!(
    user_id: current_user.id,
    song_id: params[:song_id]
  )
  redirect '/songs'
end

post '/review' do
  Review.create!(
    user_id: current_user.id,
    song_id: params[:song_id],
    review: params[:review],
    rating: params[:rating]
  )
  redirect '/songs'
end

post '/review/delete' do
  @review = Review.where(
    user_id: current_user.id, 
    song_id: params[:id]
  ).limit(1)
  @review.destroy_all
  redirect '/'
end
