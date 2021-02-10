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
            profile = Profile.new(name: @user.user_name, bio: "Write your bio here!", age: 0, favorite_series: "Enter your favorite series here!")
            @user.profile = profile
            session["user_id"] = @user.id
            redirect "/lists"
        else
            redirect '/signup'
        end
    end
    
    
    end