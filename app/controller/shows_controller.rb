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
    @show = Show.create(params)
    redirect to "/shows/#{@show.id}"
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