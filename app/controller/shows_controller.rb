class ShowsController < ApplicationController
  get '/shows' do
   authenticate
   @shows = Show.all 
   erb :'shows/index'
  end
end