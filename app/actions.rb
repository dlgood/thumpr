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
    @stories = Story.where(team_id: get_current_user.team_id).all
    @team = User.where(team_id: get_current_user.team_id).all
    erb :'stories/index'
  else
    erb :'session/new'
  end
end

get '/stories' do
  @stories = Story.where(team_id: get_current_user.team_id).all
  @team = User.where(id: get_current_user.team_id).all
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
    assignee_id:  params[:userid].to_i,
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
  get_all_users
  erb :'stories/edit'
end  

post '/stories/edit' do 
  @story = Story.find(params[:id]).update_attributes(params[:story])
  # if @story.save
  #   redirect '/stories'
  #   #should add callout to top of all stories saying story saved successfully
  # else
    @stories = Story.all
    erb :'stories/index'
  # end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @stories = Story.all
  erb :'users/profile'
end
