class UserController < ApplicationController
  get '/login' do
    erb :'sessions/login'
  end
  
  post '/login' do 
    user = User.find_by(username: params[:username])
    if !!user
      session[:user_id] = user.id
      redirect :'posts/index'
    else 
      erb :'sessions/login'
    end 
  end
  
  get '/signup' do
    erb :'sessions/signup'
  end
end