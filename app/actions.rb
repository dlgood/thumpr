helpers do 
  def user_logged_in?
    session[:email] && session[:email] != ""
  end

  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end

  def get_current_team
    Team.find(get_current_user.team_id)
  end

  def get_user_img
    user = get_current_user
    if user.file.file
      user.file
    else
      "https://www.libstash.com/public/avatars/default.png"
    end
  end

  def get_all_users
    @users = User.all
  end

  def get_team_users
    User.where(team_id: get_current_user.team_id)
  end
end

get '/' do
  if user_logged_in?
    redirect '/stories'
  else
    redirect '/session/new'
  end
end

get '/session/new' do 
  erb :'session/new'
end

post '/session/new' do
  @user = User.find_by_email(params[:email])

  if @user
    session[:email] = @user.email
    redirect '/'
  else
    flash[:error] = 'We don\'t recognize you. Please try again.'
    erb :'session/new'
  end
end

get '/session' do
  session[:email] = ""
  redirect '/'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    name:     params[:name],
    email:    params[:email],
    password: params[:password]
  )
  if @user.save
    session[:email] = @user.email
    redirect '/'
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @stories = Story.all
  erb :'users/profile'
end

get '/users/:id/photo' do
  if get_current_user == User.find(params[:id])
    @user = get_current_user
    erb :'users/photo'
  else
    @user = User.find(params[:id])
    @stories = Story.all
    erb :'users/profile'
  end
end

post '/users/:id/photo' do
  @user = get_current_user
  @user.file = params[:file]
  @user.file.resize_to_fill(200, 200)
  @user.save! 

  @stories = Story.all
  erb :'/users/profile'
end

get '/stories' do
  @stories = Story.where(team_id: get_current_user.team_id).order(priority: :desc).all
  @team = User.where(id: get_current_user.team_id).all
  erb :'stories/index'
end

# Returns JSON of all stories belonging user's team

get '/stories/json' do
  @stories = Story.where(team_id: get_current_user.team_id)
  content_type 'application/json'
  @stories.to_json(include: [:user, :assignee])
end

get '/teams/:id' do
  @stories = Story.where(team_id: :id).order(priority: :desc).all
  @team = User.where(team_id: :id).all
  erb :'stories/index'
end

get '/stories/new' do 
  get_all_users
  @story = Story.new
  erb :'stories/new'
end  

post '/stories' do 
  @story = Story.new(params[:story])
  if @story.save
    flash[:notice] = 'Your story was successfully created. Nice writin\'!'
    redirect '/stories'
  else
    flash[:error] = 'There was a problem with your story. Please try again.'
    redirect '/stories/new'
  end
end

get '/stories/:id/edit' do
  get_all_users
  @story = Story.find (params[:id])
  erb :'stories/edit'
end  

post '/stories/edit' do 
  @story = Story.find(params[:id]).update_attributes(params[:story])
  flash[:notice] = 'Your story was successfully updated. Good edits!'
  redirect '/stories'
end
