class ShowsController < ApplicationController
  get '/shows' do
   authenticate
   @shows = Show.all 
   erb :'shows/index'
  end
  
  get '/shows/new' do 
    erb :'shows/new' 
  end
end