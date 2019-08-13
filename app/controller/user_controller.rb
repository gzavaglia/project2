class UserController < ApplicationController
  get '/login' do
    @failed = false
    erb :'sessions/login'
  end
  
  post '/login' do 
    user = User.find_by(username: params[:username])
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #erb :'shows/index'
      redirect '/home'
    else 
      @failed = true
      erb :'sessions/login'
    end 
  end
  
  get '/signup' do
    redirect '/home' if logged_in?
    erb :'sessions/signup'
  end
  
  post '/users' do 
    @user = User.create(name: params[:name], username: params[:username], password: params[:password])
    if @user.errors.any?
      erb :'sessions/signup'
    else
      @user.save
      session[:user_id] = @user.id
      erb :'/home'
    end
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
end