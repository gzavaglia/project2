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
end