class ShowsController < ApplicationController
  get '/shows' do
   authenticate
   erb :'shows/index'
  end
end