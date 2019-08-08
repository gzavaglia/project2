class ApplicationController < Sinatra::Base
  
  configure do 
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end
  
  get '/' do
    erb :index
  end
end