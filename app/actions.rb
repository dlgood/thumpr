helpers do 
  def user_logged_in?
    session[:email] && session[:email] != ""
  end

  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end

  def get_all_users
    @users = User.all
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

get '/' do
  if user_logged_in?
    @stories = Story.all
    erb :'stories/index'
  else
    erb :'session/new'
  end
end

get '/stories' do
  @stories = Story.all
  erb :'stories/index'
end

get '/stories/new' do 
  get_all_users
  @story = Story.new
  erb :'stories/new'
end  

post '/stories' do 
  @story = Story.new(
    role:         params[:role],
    user_id:      get_current_user.id,
    goal:         params[:goal],
    benefit:      params[:benefit],
    fftext:       params[:fftext],
    assignee_id:  params[:userid],
    priority:     params[:priority],
    team_id:      get_current_user.team_id
  )
  if @story.save
    redirect '/stories'
    #should add callout to top of all stories saying story saved successfully
  else
    erb :'stories/new'
  end
end

get '/stories/edit/:id' do
  @story = Story.find params[:id]
  erb :'stories/edit'
end  


