get '/users/new' do
	erb :"users/new"
end

get '/users/:id' do
  @user = User.find(params[:id]);
  erb :"users/show"
end

post '/users' do
	new_user = User.new(username: params[:username], password: params[:password])
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/posts"
  else
    @errors = new_user.errors.full_messages
    erb :"users/new"
  end
end
