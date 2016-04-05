get '/session/new' do
 	erb :"session/new"
end

post '/session' do
  found_user = User.find_by(username: params[:username])
  if found_user
    if found_user.authenticate?(params[:password])
      session[:user_id]=found_user.id
      redirect '/posts'
    else
    @error = "There was a problem logging in."
    erb :"session/new"
    end
  else
    @error = "There was a problem logging in."
    erb :"session/new"
  end
end

get '/logout' do
	session.delete(:user_id)
  redirect "/"
end

get '/session-viewer' do
  session.inspect
end