helpers do 
  def user_logged_in?
    session[:email] && session[:email] != ""
  end

  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end
end

get '/signin' do 
  erb :'users/signin'
end

post '/signin' do
  @user = User.find_by_email(params[:email])

  if @user
    session[:email] = @user.email
    redirect '/'
  else
    erb :'users/register'
  end
end

get '/logout' do
  session[:email] = ""
  redirect '/'
end

get '/register' do
  @user = User.new
  erb :'users/register'
end

post '/register' do
  @user = User.new(
  name:     params[:name],
  email:    params[:email],
  password: params[:password]
  )
  if @user.save

    redirect '/'
  else
    erb :'users/register'
  end
end

get '/' do
  erb :index
end
