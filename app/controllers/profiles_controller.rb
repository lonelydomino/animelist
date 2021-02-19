class ProfileController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/profile' do
        redirect_if_not_logged_in
        erb :'profile/show'
    end
    get '/profile/:id' do
        redirect_if_not_logged_in
        erb :'profile/show'
    end

    get '/profile/:id/edit' do
        redirect_if_not_logged_in
        erb :'/profile/edit'
    end

    patch '/profile/:id' do
        redirect_if_not_logged_in
        profile = current_profile
    
        if profile.update(params[:profile])
            redirect "/profile/#{profile.id}"
        else
            redirect "/profile/edit"
        end
    end

end