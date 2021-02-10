class UserController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/signup' do
        erb :'users/signup'
    end
    
      
    post '/signup' do
        @user = User.new(params["user"])
        if @user.save
            profile = Profile.new
            profile.user = @user
            session["user_id"] = @user.id
            redirect "/lists"
        else
            redirect '/signup'
        end
    
    end
    
    
    end