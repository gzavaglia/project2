class ShowsController < ApplicationController
  get '/shows' do
   authenticate
   @shows = Show.all 
   erb :'shows/index'
  end
  
  get '/shows/new' do 
    erb :'shows/new' 
  end
  
  post '/shows' do
    authenticate
    cu = current_user
    cu.shows.build(content: params[:content])
    if cu.save
     redirect to "/shows/#{@show.id}"
    else
      @error_message 
      erb :'shows/new'
    end
    #@show = Show.create(params)
    
  end
  
  get '/shows/:id' do
    @show = Show.find(params[:id])
    erb :'shows/show'
  end
  
  get '/shows/:id/edit' do
    @show = Show.find(params[:id])
    erb :'shows/edit'
  end
  
  patch '/shows/:id' do
    @show = Show.find(params[:id])
    @show.title = params[:title]
    @show.seasons = params[:seasons]
    @show.channel = params[:channel]
    @show.save
    redirect to "/shows/#{@show.id}"
  end
  
  delete '/shows/:id' do
    show = Show.find(params[:id])
    show.delete
    redirect to '/shows'
  end
end