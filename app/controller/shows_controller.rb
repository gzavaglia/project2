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
        @error_message 
        erb :'shows/new'
      end
    end
    #@show = Show.create(params)
    
  end
  
  get '/shows/:id' do
    authenticate
    @show = Show.find(params[:id])
    erb :'shows/show'
  end
  
  get '/shows/:id/edit' do
    authenticate
    @show = Show.find(params[:id])
    authorized?(@show)
    erb :'shows/edit'
  end
  
  patch '/shows/:id' do
    authenticate
    @show = Show.find_by(params[:id])
    authorized?(@show)
    @show.title = params[:title]
    @show.seasons = params[:seasons]
    @show.channel = params[:channel]
    @show.save
    redirect to "/shows/#{@show.id}"
  end
  
  delete '/shows/:id/delete' do
    authenticate
    show = Show.find(params[:id])
    show.delete
    redirect to '/shows'
  end
end