# Homepage (Root path)
get '/' do
  erb :index
end

get '/stories/new' do 
  @story = Story.new
  erb :'stories/new'
end  

post '/stories' do 
  @story = Story.new(
    role: params[:role],
    goal: params[:goal],
    benefit: params[:benefit],
    fftext: params[:fftext],
    assignee: params[:assignee],
    priority: params[:priority]
  )
  if @story.save
    redirect '/stories/all'
    #should add callout to top of all stories saying story saved successfully
  else
    erb :'stories/new'
  end
end  