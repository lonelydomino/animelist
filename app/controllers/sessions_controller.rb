class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by_email(params["user"]["email"])
        if user && user.authenticate(params["user"]["password"])
            session[:user_id] = user.id
            redirect '/animes'
        else
            #flash[:error] = "Invalid login credentials!"
            redirect 'login'
        end
    end

    get '/logout' do
        session.delete(:user_id)
        redirect '/'
    end
end