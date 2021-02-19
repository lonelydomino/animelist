class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV["SESSION_SECRET"]
        register Sinatra::Flash
    end

    

    get '/' do
        erb :home
    end

    helpers do 

        def logged_in?
            @current_user ||= User.find_by(id: session["user_id"]) if session["user_id"]
        end
        
        def current_user
            @current_user = User.find_by(id: session["user_id"])
        end

        def current_profile
           @current_profile = current_user.profile 
        end

        def redirect_if_not_logged_in
            if !logged_in?
                redirect '/login'
            end
        end

        def anime_total
            total = 0
            current_user.lists.each do |list|
                total += list.animes.count
            end
            total
        end

    end
    
end