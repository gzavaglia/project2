class ShowsController < ApplicationController
  get '/shows' do
   authenticate
   cu = current_user
   #@shows = Show.all 
   @shows = cu.shows
   erb :'shows/index'
  end
  
  get '/shows/new' do 
    erb :'shows/new' 
  end
  
  post '/shows' do
    authenticate
    cu = current_user
    cu.shows.build(params)
    @blank_error = false
    if params[:title].empty? || params[:channel].empty? || params[:seasons].empty?
      @blank_error = true
      erb :'shows/new'
    else 
      if cu.save
       redirect to "/shows"
      else
        # @error_message 
        # erb :'shows/new'
        erb :'/shows/error'
      end
    end
    
  end
  
  get '/shows/:id' do
    authenticate
    @show = Show.find(params[:id])
    authorized?(@show)
    erb :'shows/show'
    rescue ActiveRecord::RecordNotFound
     redirect to "/shows"
  end
  
  get '/shows/:id/edit' do
    authenticate
    @show = Show.find(params[:id])
    authorized?(@show)
    erb :'shows/edit'
    rescue ActiveRecord::RecordNotFound
     redirect to "/shows"
  end
  
  patch '/shows/:id' do
    authenticate
    @show = Show.find(params[:id])
    authorized?(@show)
    @show.title = params[:title]
    @show.seasons = params[:seasons]
    @show.channel = params[:channel]
    if @show.save 
      redirect to "/shows/#{@show.id}"
    else
      erb :'/shows/error'
    end

    #redirect to "/shows/#{@show.id}"
  end
  
  delete '/shows/:id/delete' do
    authenticate
    show = Show.find(params[:id])
    authorized?(show)
    show.delete
    redirect to '/shows'
  end

  get '/shows/:id/users' do 
    show = Show.find(params[:id])
    users = User.all 
    @user_shows = users.select do |user|
     user.shows.any?{|show1| show1.title == show.title }
    end
    erb :'shows/users'
  end

end