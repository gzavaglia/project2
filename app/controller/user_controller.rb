class UserController < ApplicationController
  get '/login' do
    erb :'sessions/login'
  end
  
  get '/signup' do
    erb :'sessions/login'
  end
end