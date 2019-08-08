class ApplicationController < Sinatra::Base
  
  configure do 
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    erb :index
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
    def current_user
      User.find_by(id: session[:user_id])
    end
  end
  
end